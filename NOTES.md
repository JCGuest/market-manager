--Clerk - email, password_digest, title
    have many orders
    have many customers through orders


--Customer - name, phone number
    have many orders
    have manny clerks through orders

--Orders - customer_id, clerk_id, item, amount, pick_up, 
    belong to clerk
    belong to customer
    


clerk will login and see an index of their orders, ie clerks/:clerk_id/orders
add complete boolean to orders
add amount to orders