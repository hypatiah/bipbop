# October 5, 2016

## SQL
* What is the difference between a View and a Table?
  - Table: contains data, collection of related data entries consisting of rows and columns.
  - View: A virtual table, or a SELECT statement that has been saved in the db. You can't change anything in the db, just a set of tables (views don't store actual data)
* What does the HAVING clause do?

*What are the current grades, names, locations, and vote counts for all politicians whose current grades are less than 9.00 ordered by current grade from high to low?*

SELECT congress_members.grade_current, congress_members.name, congress_members.location, COUNT(votes.politician_id) FROM congress_members JOIN votes ON congress_members.id = votes.politician_id GROUP BY congress_members.name HAVING COUNT(congress_members.grade_current) < 9 ORDER BY congress_members.grade_current DESC;
grade_current  name                      location    COUNT(votes.politician_id)
-------------  ------------------------  ----------  --------------------------
12.93132331    Rep. Ileana Ros-Lehtinen  FL          8
11.56066479    Rep. Jim Sensenbrenner    WI          7
10.23278515    Rep. Tim Huelskamp        KS          8
9.285165569    Rep. Bill Cassidy         LA          7

*NOTE: to change format in terminal to prettty itty*
.show
- .header on
- .mode column
- .nullvalue NULL #changes nullvalue to null
