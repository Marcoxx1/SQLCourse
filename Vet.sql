USE veterinara;

SELECT u.name, ut.name
FROM users u
INNER JOIN user_types ut
	ON u.user_type_id = ut.id