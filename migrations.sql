-- ### customers

-- 1. Both columns `first` and `last` have ambiguous names. Rename them to `first_name` and `last_name`.

ALTER TABLE customers RENAME COLUMN first TO first_name;
ALTER TABLE customers RENAME COLUMN last TO last_name;

-- 2. Because the current column type of `first` and `last` are `text`, these columns have almost no limit to how much content they can store. We've noticed garbage registrations with first and last names over 20kb! Change the column types of these to a varchar with a max of 255 characters.

ALTER TABLE customers ALTER COLUMN first_name TYPE varchar(255);
ALTER TABLE customers ALTER COLUMN last_name TYPE varchar(255);

-- 3. The `social` column also has some dirty data, some customers have entered their social with dashes, others without, others with spaces. We've decided to store only the numbers of a users social. Which means all `social` values should be exactly 9 characters. Change the column type to allow only 9 characters.

ALTER TABLE customers ALTER COLUMN social TYPE char(9);

-- 4. The `account_number` column has the same issue, the city's account numbers are 14 characters. Update the column type.

ALTER TABLE customers ALTER COLUMN account_number TYPE char(14);

-- 5. Someone forgot to add a `line_2` column, add one.

ALTER TABLE customers ADD line_2 varchar(255);

-- 6. The `zip` column is currently an integer, but we're loosing digits from customers with zip codes that start with zeros. Change the column type appropriately.

ALTER TABLE customers ALTER COLUMN zip TYPE varchar(255);

-- 7. Remove the `current_balance_cents` column. It was added for performance reasons, but there's a bug in the application code and it's often out of date.

ALTER TABLE customers DROP COLUMN current_balance_cents;

-- ### statements

-- 1. The `customer_id` column allows null values, change it so a value is required.

ALTER TABLE statements ALTER COLUMN customer_id SET NOT NULL; 

-- 2. We've updated our water meters and we can accurately measure fractional gallons. Update `gallons_used` to allow for two decimal places.

ALTER TABLE statements ALTER COLUMN gallons_used TYPE decimal;

-- 3. Add a default value "payment_due" to `status`.

ALTER TABLE statements ALTER COLUMN status SET DEFAULT 'payment_due';

