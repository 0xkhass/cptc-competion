| date     | type    | description                                                                                                                                                                                                                     | city     |
| -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| 20180215 | murder  | REDACTED REDACTED REDACTED                                                                                                                                                                                                      | SQL City |
| 20180215 | murder  | Someone killed the guard! He took an arrow to the knee!                                                                                                                                                                         | SQL City |
| 20170712 | theft   | A lone hunter stalks the night, firing arrows into the Darkness. There is no hiding, no escape. In the distance, the beast falters, tethered to the void. The killing blow comes without hesitation, without mercy.             | SQL City |
| 20170820 | arson   | Wield the Hammer of Sol with honor, Titan, it is a thing of legend, both past and future.                                                                                                                                       | SQL City |
| 20171110 | robbery | The Gjallarhorn shoulder-mounted rocket system was forged from the armor of Guardians who fell at the Twilight Gap. Gifted to the survivors of that terrible battle, the Gjallarhorn is seen as a symbol of honor and survival. | SQL City |
| 20180103 | bribery | Apparently, Cayde thought it necessary to expose this extremely rare vegetable to a Hive summoning ritual.                                                                                                                      | SQL City |
| 20180115 | assault | Hamilton: Lee, do you yield? Burr: You shot him in the side! Yes he yields!                                                                                                                                                     | SQL City |
| 20180115 | assault | Report Not Found                                                                                                                                                                                                                | SQL City |
| 20180115 | murder  | Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".                                       | SQL City |


| id             | name           | License_ID | Address_number | Address_Street_Name | SSN       |
| -------------- | -------------- | ---------- | -------------- | ------------------- | --------- |
| 99826          | Ivy Kazarian   | 994470     | 892            | Northwestern Dr     | 208359813 |
| Second Witness |                |            |                |                     |           |
| 16371          | Annabel Miller | 490173     | 103            | Franklin Ave        | 318771143 |
|                |                |            |                |                     |           |


Interview
SELECT * 
	FROM interview
	WHERE person_id = "55662"
         

|person_id|transcript|
|---|---|
|16371|I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.|


Gym checkins on Jan/9th

| membership_id | check_in_date | check_in_time | check_out_time |
| ------------- | ------------- | ------------- | -------------- |
| X0643         | 20180109      | 957           | 1164           |
| UK1F2         | 20180109      | 344           | 518            |
| XTE42         | 20180109      | 486           | 1124           |
| 1AE2H         | 20180109      | 461           | 944            |
| 6LSTG         | 20180109      | 399           | 515            |
| 7MWHJ         | 20180109      | 273           | 885            |
| GE5Q8         | 20180109      | 367           | 959            |
| 48Z7A         | 20180109      | 1600          | 1730           |
| 48Z55         | 20180109      | 1530          | 1700           |
| 90081         | 20180109      | 1600          | 1700           |


Gym Members checkins at 9/1

| id    | person_id | name              | membership_start_date | membership_status |
| ----- | --------- | ----------------- | --------------------- | ----------------- |
| 1AE2H | 10815     | Adriane Pelligra  | 20170816              | silver            |
| 48Z55 | 67318     | Jeremy Bowers     | 20160101              | gold              |
| 48Z7A | 28819     | Joe Germuska      | 20160305              | gold              |
| 6LSTG | 83186     | Burton Grippe     | 20170214              | gold              |
| 7MWHJ | 31523     | Blossom Crescenzo | 20180309              | regular           |
| 90081 | 16371     | Annabel Miller    | 20160208              | gold              |
| GE5Q8 | 92736     | Carmen Dimick     | 20170618              | gold              |
| UK1F2 | 28073     | Zackary Cabotage  | 20170818              | silver            |
| X0643 | 15247     | Shondra Ledlow    | 20170521              | silver            |
| XTE42 | 55662     | Sarita Bartosh    | 20170524              | gold              |