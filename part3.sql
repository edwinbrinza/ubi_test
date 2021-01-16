select a.customerid, a.order_date, a.order_datetime, a.address, a.ip_address, nvl(sum(b.amount_eur),0) as amount_10min from schematransaction a
left join schematransaction b
on a.customerid=b.customerid and b.order_datetime>=from_unixtime(to_unix_timestamp(a.order_datetime)-600) and b.order_datetime<a.order_datetime
group by a.customerid, a.order_date, a.order_datetime, a.address, a.ip_address
order by a.customerid, a.order_datetime;
