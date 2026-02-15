select contest_id, round((count(distinct(r.user_id))/(select count(distinct user_id) from Users)*100),2) as percentage
from Users u join Register r
on u.user_id = r.user_id
group by contest_id
Order by percentage desc, contest_id ;
