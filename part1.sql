select *,
count(distinct s.ip_address) over (partition by customerid) as ip_LTD,
sum(s.amount_eur) over (partition by customerid order by s.order_datetime) as amount_UTD
from schematransaction as s
order by customerid, order_datetime asc;
