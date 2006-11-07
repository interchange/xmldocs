__NAME__ synopsis 
<row>

	<entry>
	locale
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
	currency
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
	get
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
	persist
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
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__



LI1: [setlocale locale=locale* currency=locale* persist=1*]
Immediately sets the locale to C<locale>, and will cause it to persist in future user pages if the C<persist> is set to a non-zero, non-blank value. If the C<currency> attribute is set, the pricing and currency-specific locale keys and Interchange configuration directives are modified to that locale. If there are no arguments, it sets it back to the user's default locale as defined in the scratch variables C<mv_locale> and C<mv_currency>.

.This allows:

!block example; listitem=2
Dollar Pricing:

[setlocale en_US]
[item-list]
[item-code]: [item-price]<BR>
[/item-list]

Franc Pricing:

[setlocale fr_FR]
[item-list]
[item-code]: [item-price]<BR>
[/item-list]

[comment] Return to the user's default locale [/comment]
[setlocale]
!endblock


 Here's a general example for 
 locale <literal>fr_FR</literal>:
 <programlisting>
 [setlocale locale=fr_FR currency=fr_FR persist=1]
 </programlisting>
 The above would immediately switch locale to <literal>fr_FR</literal>, and 
 persist for the duration of the user session. A call to &tag-setlocale; without
 arguments would switch back to the default locale (settings of
 <mv>mv_locale</mv> and <mv>mv_currency</mv>).

