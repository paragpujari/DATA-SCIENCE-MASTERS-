USE SQL_PORTFOLIO;

/*

Cleaning Data in SQL Queries

*/


SELECT * FROM housing;


-- Standardize Date Format

SELECT CONVERT(DATE, SaleDate) AS Date_Key,* FROM housing;

ALTER TABLE housing
ADD Date_Key DATE;

UPDATE housing
SET Date_Key = CONVERT(DATE, SaleDate);


SELECT * FROM housing WHERE ParcelID = '113 14 0A 002.00';


-- Populate Property Address data
;with cte as(
SELECT  ROW_NUMBER() OVER(PARTITION BY ParcelID ORDER BY UniqueID) as rwn,
* FROM housing --WHERE PropertyAddress IS  NULL AND ParcelID = '114 15 0A 030.00'
)
select * from cte where rwn > 1 AND PropertyAddress IS NULL;



SELECT a.ParcelID, b.ParcelID, a.PropertyAddress, b.PropertyAddress 
FROM housing a
JOIN housing b
ON a.ParcelID = b.ParcelID
AND a.[UniqueID ] <> b.[UniqueID ]
WHERE b.PropertyAddress IS NULL;

UPDATE  b
SET b.PropertyAddress = ISNULL(a.PropertyAddress,0)
FROM housing a
JOIN housing b
ON a.ParcelID = b.ParcelID
AND a.[UniqueID ] <> b.[UniqueID ]
WHERE b.PropertyAddress IS NULL;

SELECT a.ParcelID, b.ParcelID, a.PropertyAddress, b.PropertyAddress 
FROM housing a
JOIN housing b
ON a.ParcelID = b.ParcelID
AND a.[UniqueID ] <> b.[UniqueID ]



-- Breaking out Address into Individual Columns (Address, City, State)

SELECT SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1) as first_end,
SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress)+1, LEN(PropertyAddress)) as second_end
FROM housing;


ALTER TABLE housing ADD PropertySplithousing NVARCHAR(255);

UPDATE housing
SET PropertySplithousing = SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1);

SELECT * FROM housing;

ALTER TABLE housing ADD PropertySplitCity NVARCHAR(255);

UPDATE housing
SET  PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress)+1, LEN(PropertyAddress))


/*

Cleaning Data in SQL Queries

*/


Select *
From PortfolioProject.dbo.NashvilleHousing

--------------------------------------------------------------------------------------------------------------------------

-- Standardize Date Format


Select saleDateConverted, CONVERT(Date,SaleDate)
From PortfolioProject.dbo.NashvilleHousing


Update NashvilleHousing
SET SaleDate = CONVERT(Date,SaleDate)

-- If it doesn't Update properly

ALTER TABLE NashvilleHousing
Add SaleDateConverted Date;

Update NashvilleHousing
SET SaleDateConverted = CONVERT(Date,SaleDate)


 --------------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data

Select *
From PortfolioProject.dbo.NashvilleHousing
--Where PropertyAddress is null
order by ParcelID



Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
From PortfolioProject.dbo.NashvilleHousing a
JOIN PortfolioProject.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null


Update a
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
From PortfolioProject.dbo.NashvilleHousing a
JOIN PortfolioProject.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null




--------------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)


Select PropertyAddress
From PortfolioProject.dbo.NashvilleHousing
--Where PropertyAddress is null
--order by ParcelID

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress)) as Address

From PortfolioProject.dbo.NashvilleHousing


ALTER TABLE NashvilleHousing
Add PropertySplitAddress Nvarchar(255);

Update NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 )


ALTER TABLE NashvilleHousing
Add PropertySplitCity Nvarchar(255);

Update NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress))




Select 
REPLACE(OwnerAddress,',','.'),
PARSENAME(REPLACE(OwnerAddress,',','.'),1),
PARSENAME(REPLACE(OwnerAddress,',','.'),2),
PARSENAME(REPLACE(OwnerAddress,',','.'),3)
From housing
WHERE OwnerAddress IS NOT NULL;


ALTER TABLE housing ADD OwnerSplitCountry  NVARCHAR(255);

ALTER TABLE housing ADD OwnerSplitCity  NVARCHAR(255);


ALTER TABLE housing ADD OwnerSplitAddress  NVARCHAR(255);


UPDATE housing SET OwnerSplitCountry = PARSENAME(REPLACE(OwnerAddress,',','.'),1);

UPDATE housing SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',','.'),2);

UPDATE housing SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',','.'),3);


SELECT * FROM housing;


ALTER TABLE housing DROP COLUMN OwnerAddress;


SELECT SoldAsVacant, COUNT(SoldAsVacant) as cnt
FROM housing
GROUP BY SoldAsVacant;


SELECT SoldAsVacant, CASE WHEN SoldAsVacant = 'N' THEN 'No'
                          WHEN SoldAsVacant = 'Y' THEN 'Yes'
						  ELSE SoldAsVacant
						  END AS result
						  FROM housing


ALTER TABLE housing ADD result NVARCHAR(255);

UPDATE housing SET SoldAsVacant = CASE WHEN SoldAsVacant = 'N' THEN 'No'
                                       WHEN SoldAsVacant = 'Y' THEN 'Yes'
									   ELSE SoldAsVacant
									   END

SELECT * FROM housing

-- Remove Duplicates

;with cte as(
SELECT ROW_NUMBER()OVER(PARTITION BY ParcelID, PropertyAddress,SaleDate,SalePrice,LegalReference
ORDER BY UniqueID) as rwn,* FROM housing
)
delete from cte where rwn > 1 ;

SELECT * FROM housing;



-- Delete Unused Columns
ALTER TABLE  housing DROP COLUMN TaxDistrict, PropertyAddress, SaleDate;