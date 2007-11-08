__NAME__ purpose
perform a transaction with a payment gateway
__END__

__NAME__ synopsis 
<row>

	<entry>
	route
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	amount
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	amount of money to charge
	</entry>

</row> 
<row>

	<entry>
	gateway
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	payment &glos-gateways;
	</entry>

</row> 
<row>

	<entry>
	cyber_mode
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	log_to_error
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	hash
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	No
	</entry>
	<entry>
	Return results as a hash reference?
	</entry>

</row> 
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__

__NAME__ see also
MV_PAYMENT_CURRENCY, MV_PAYMENT_PRECISION
__END__