--Clerk - email, password_digest, title
    have many orders
    have many customers through orders


--Customer - name, phone number
    have many orders
    have manny clerks through orders

--Orders - customer_id, clerk_id, item, amount, pick_up, 
    belong to clerk
    belong to customer
    


todo--
add authorization, add flash. add completed check box
find an asset pipeline to use
add validations
error messages

stuff for interview--
learn more about oauth create action
path vs url