WITH sales AS
(
    SELECT 
        sales_id,
        product_sk,
        customer_sk, 
        {{multiply('unit_price','quantity') }} as calculated_gross_amount,   
        gross_amount,
        payment_method
    FROM 
        {{ ref('bronze_sales') }}
),

products AS
(
    SELECT 
         product_sk,
         category 
    FROM 
        {{ ref('bronze_dim_product') }}
),
customer AS
(
    SELECT 
            customer_sk,
            gender   
    from
       {{ ref('bronze_dim_customer') }}   
),
 
joined_query AS
(
SELECT 
    sales.sales_id,
    products.category,
    sales.gross_amount,
    sales.payment_method,
    customer.gender
FROM
     sales
join 
   products ON sales.product_sk=products.product_sk
join
   customer ON sales.customer_sk=customer.customer_sk
)

SELECT 
     category,
     gender,
     sum(gross_amount) as total_sales
FROM
    joined_query
GROUP BY
    category,
    gender
ORDER BY 
     total_sales DESC