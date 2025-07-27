select round(sum(
    case when order_date = customer_pref_delivery_date then 1 else 0 end)
    *100/ count(*),2) as immediate_percentage
    from (
        select
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date
        from Delivery
        where 
     (customer_id, order_date) IN (
            SELECT 
                customer_id, 
                MIN(order_date)
            FROM 
                Delivery
            GROUP BY 
                customer_id
        )
);