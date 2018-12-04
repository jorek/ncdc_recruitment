# Recruitment tasks for NCDC
## SQL & PL/SQL assessment
### Completed by Piotr Jorkowski
##### Suggested installation steps:
0. Clone this repository.
1. Run *sqlplus* from the main directory within this repository.
2. Connect to a database of your choice.
3. Run the *1_Install.sql* script:
```sql
    @1_Install.sql
```
4. Examine created log file, *install_log.txt*
5. Examine created data in the DB.
6. Run the *2_Demo.sql* script. It shows the recruitment tasks' solution in action:
 ```sql
    @2_Demo.sql
```
##### Remarks:
* All objects created by these scripts are left undeleted.
* Data scripts are not prepared for multiple execution.
