Welcome to your new dbt project!

### Using the starter project

To start with dbt development download the repo to a desktop or project folder.
Open the downloaded folder in vscode
Set below environment variables (need for command line dbt run)
export dbt_username=*******
export dbt_password=******* 
export DBT_PROFILES_DIR=/c/Users/SriGujjarlapudi/dbtdemo  (location where profile and profile yml file are located)
Run below command before you start developing models.
  dbt debug
  dbt deps
If everything works start developing your models.
