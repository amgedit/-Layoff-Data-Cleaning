--Backup of original data--


create table layoffs_2
( 
      company varchar(100)
      ,location_ varchar(100)
      , industry varchar(100),
	  total_laid_off  float,
      percentage_laid_off varchar(100),
      date_ date
      ,stage varchar(100)
      ,country varchar(100)
      ,funds_raised_millions float
	  );

select *
from layoffs_2;

insert into layoffs_2 ([company],[location_],[industry],[total_laid_off],
 [percentage_laid_off],[date_],[stage],[country],[funds_raised_millions])

 select [company],[location],[industry],[total_laid_off],
 [percentage_laid_off],[date],[stage],[country],[funds_raised_millions]
 from layoffs$;
 -------------------------------------------------------------------------------------

 select *, ROW_NUMBER() over(partition by company,location_,industry,total_laid_off,
 percentage_laid_off,date_,stage,country,funds_raised_millions
 order by company) as Number_Rows

 from layoffs_2;
 

 -------------------------view Depulecte
 with Depulectte AS
 (
 SELECT *, ROW_NUMBER() over(partition by company,location_,industry,total_laid_off,
 percentage_laid_off,date_,stage,country,funds_raised_millions
 order by company) as Number_Rows from layoffs_2


 )

 select * from Depulectte,layoffs_2
 where Number_Rows>1;

 --------------------------Delete Depulecte
 with Depulectte AS
 (
 SELECT *, ROW_NUMBER() over(partition by company,location_,industry,total_laid_off,
 percentage_laid_off,date_,stage,country,funds_raised_millions
 order by company) as Number_Rows from layoffs_2


 )

 Delete from Depulectte
 where Number_Rows>1 ;

 ---------------

 select * from layoffs_2;


 -----------------View Data to find problem_1


 select Distinct( company) from layoffs_2;

 select  company ,  TRIM(company) from layoffs_2;

 ----------------Clean Excess space

 update layoffs_2 
 set company = TRIM(company);

  -----------------View Data to find problem_2

  select Distinct( industry) from layoffs_2
  order by industry;

  ------------------Standardizing data_1

  update layoffs_2
  set industry = 'Crypto'
  where industry like 'Crypto%'

  select industry from layoffs_2
  where industry like 'Crypt%'

  -----------------View Data to find problem_3

   select Distinct( location_) from layoffs_2
  order by location_;

  --No_Problem


    -----------------View Data to find problem_4

	  select Distinct( country) from layoffs_2
  order by country;

    ------------------Standardizing data_2

	update layoffs_2
	set country = 'United States'
	where country like 'United States%'

	------------------
	 select * from layoffs_2
	 where industry is null or industry=' ';

	 select * from layoffs_2
	 where company = 'Airbnb' 


	 update layoffs_2
	 set industry = 'Travel'   
	 where company = 'Airbnb' 


	
	----------------------
	 select * from layoffs_2


	 select *
	 from layoffs_2 
	 where total_laid_off IS NULL AND 
	 percentage_laid_off = 'NULL' ;


	  Delete 
	 from layoffs_2 
	 where total_laid_off IS NULL AND 
	 percentage_laid_off = 'NULL' ;