
/*query 1:*/


127.0.0.1/cr09_carina_delivery/mail_item/		http://localhost/phpmyadmin/db_sql.php?db=cr09_carina_delivery
 Showing rows 0 -  4 (5 total, Query took 0.0020 seconds.)

SELECT fk_name_sender, name_recipient FROM mail_item INNER JOIN recipient on fk_item_id = item_id

fk_name_sender					name_recipient	

Brigitte Obermaier					Michaela Gründorf	
Ursula Lauber						Franz Huber	
Elisabeth Grünstadl					Laura Bergmair	
Hugo König							Gundula Ostermayr	
Laura Baumgartner					Franz Huber	


/*query 2:*/

127.0.0.1/cr09_carina_delivery/mail_item/		http://localhost/phpmyadmin/db_sql.php?db=cr09_carina_delivery
 Showing rows 0 -  5 (6 total, Query took 0.0010 seconds.)

SELECT type_size_identifier, mailing_price FROM mail_item


type_size_identifier	mailing_price	

envelope_M					2.4	
postcard_S					0.7	
postcard_S					0.6	
package_M					5.6	
package_XL					12.8	
package_L					9.8	

/*query 3:*/

127.0.0.1/cr09_carina_delivery/mail_item/		http://localhost/phpmyadmin/db_sql.php?db=cr09_carina_delivery
 Showing rows 0 -  4 (5 total, Query took 0.0280 seconds.)

SELECT fk_name_sender, priority, name_recipient FROM mail_item INNER JOIN recipient on fk_item_id = item_id


fk_name_sender				priority				name_recipient	

Brigitte Obermaier			normal					Michaela Gründorf	
Ursula Lauber				normal					Franz Huber	
Elisabeth Grünstadl			normal					Laura Bergmair	
Hugo König					high					Gundula Ostermayr	
Laura Baumgartner			high					Franz Huber	

/*query 4:*/

127.0.0.1/cr09_carina_delivery/mail_item/		http://localhost/phpmyadmin/db_sql.php?db=cr09_carina_delivery
 Showing rows 0 -  1 (2 total, Query took 0.0010 seconds.)

SELECT fk_name_sender FROM mail_item WHERE type_size_identifier = "postcard_S"


fk_name_sender	

Ursula Lauber	
Elisabeth Grünstadl	

/*query 5:*/

127.0.0.1/cr09_carina_delivery/sender/		http://localhost/phpmyadmin/db_sql.php?db=cr09_carina_delivery
 Showing rows 0 -  5 (6 total, Query took 0.0010 seconds.) [name_sender: ALBERT OBERWALLNER... - URSULA LAUBER...]

SELECT name_sender FROM sender ORDER BY name_sender ASC


name_sender 

Albert Oberwallner	
Brigitte Obermaier	
Elisabeth Grünstadl	
Hugo König	
Laura Baumgartner	
Ursula Lauber	

/*query 6:*/

127.0.0.1/cr09_carina_delivery/processing/		http://localhost/phpmyadmin/db_sql.php?db=cr09_carina_delivery
 Showing rows 0 -  4 (5 total, Query took 0.0020 seconds.)

SELECT name_employee, processing_start_date, delivery_date FROM processing INNER JOIN employee on fk_employee_id_delivery = employee_id


name_employee				processing_start_date				delivery_date	

Otto Grünwald						2020-08-17						2020-08-19	
Hannelore Baum						2020-08-16						2020-08-17	
Birgit Schönbaum					2020-08-16						2020-08-17	
Otto Grünwald						2020-08-14						2020-08-15	
Annalena Grün						2020-08-18						2020-08-18	
