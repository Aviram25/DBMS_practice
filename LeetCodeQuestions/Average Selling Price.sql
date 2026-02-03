SELECT p.product_id ,ifnull( round(sum(p.price*us.units) / sum(us.units),2),0) as average_price
from Prices p left join UnitsSold us
on p.product_id = us.product_id
AND us.purchase_date  between p.start_date and p.end_date
group by p.product_id;
