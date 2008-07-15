__NAME__ purpose
manipulate a persistent, named counter
__END__

__NAME__ synopsis 
<row>

  <entry>
  <group choice='plain'>
  <arg choice='plain'>name</arg>
  <arg choice='plain'>file</arg>
  </group>
  </entry>
  <entry>
  Yes
  </entry>
  <entry>
  <!-- REQ -->
  </entry>
  <entry>
  <filename>&glos-CATROOT;/etc/counter</filename>
  </entry>
  <entry>
  Counter file to use. Taken relatively to &glos-CATROOT; unless absolute
  pathname is specified.
  </entry>

</row> 
<row>

  <entry>
  start
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
  Counter start value
  </entry>

</row> 
<row>

  <entry>
  sql
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
  A <literal><replaceable>table</replaceable>:<replaceable>field</replaceable></literal> specification, if &tag-counter; is to increment a field in an &glos-SQL; database.
  </entry>

</row> 
<row>

  <entry>
  inc_routine
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
  Routine to use to increase the counter.
  The routine should be an
  existing &PERL; function, catalog subroutine, or global subroutine
  </entry>

</row> 
<row>

  <entry>
  bypass
  </entry>
  <entry>
  <!-- POS -->
  </entry>
  <entry>
  <!-- REQ -->
  </entry>
  <entry>
  0
  </entry>
  <entry>
  Bypass the existing database connection, and instead connect to the database 
  anew, if <arg choice='plain'>sql</arg> attribute is used.
  </entry>

</row> 
<row>

  <entry>
  dsn
  </entry>
  <entry>
  <!-- POS -->
  </entry>
  <entry>
  <!-- REQ -->
  </entry>
  <entry>
  <varname>DBI_DSN</varname>
  </entry>
  <entry>
  DSN information to connect to the SQL database, if
  <arg choice='plain'>sql</arg> attribute is used
  </entry>

</row> 
<row>

  <entry>
  user
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
  User to connect to the database as, if 
  <arg choice='plain'>sql</arg> attribute is used
  </entry>

</row> 
<row>

  <entry>
  pass
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
  Password to provide during connection to the database, if 
  <arg choice='plain'>sql</arg> attribute is used
  </entry>

</row> 
<row>

  <entry>
  attr
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
  Extra content for the <function>DBI->connect</function> call
  </entry>

</row> 
<row>

  <entry>
  date
  </entry>
  <entry>
  <!-- POS -->
  </entry>
  <entry>
  <!-- REQ -->
  </entry>
  <entry>
  </entry>
  <entry>
  Date-based counter? Set to any true value, or <literal>gmt</literal> to 
  also signify GMT date
  </entry>

</row> 
<row>

  <entry>
  dec_routine
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
  Routine to use to decrease the counter
  The routine should be an
  existing &PERL; function, catalog subroutine, or global subroutine
  </entry>

</row> 
<row>

  <entry>
  value
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
  Only show the counter value, without incrementing or decrementing it?
	(This option is not applicable to SQL counters).
  </entry>

</row> 
<row>

  <entry>
  decrement
  </entry>
  <entry>
  <!-- POS -->
  </entry>
  <entry>
  <!-- REQ -->
  </entry>
  <entry>
  0
  </entry>
  <entry>
  Decrement instead of incrementing the counter?
  </entry>

</row> 
&TAG_NON_CONTAINER;
__END__


__NAME__ description
The tag provides an interface to the counter functionality within &IC;.
The counters are usually kept as text files, but can also be sequences in
&glos-SQL; tables.
</para><para>
&tag-counter; can increase and decrease counters, or set them to specific
values. In addition, custom increment or decrement functions can be
used.
__END__


__NAME__ notes
The &glos-SQL; field-updating routine is database-dependent; please see the tag
source for exact behavior.
</para><para>
Date-based counters cannot be decremented.
__END__

__NAME__ example: Basic counter file
The following creates a counter file,
<filename>counter.basic</filename> in your catalog root directory.
The counter starts at <literal>10</literal>.
<programlisting>
[counter file=counter.basic start=10]
</programlisting>
__END__


__NAME__ example: Basic date-based counter file
The following creates two date-based counter files,
<filename>counter.loc</filename> and
<filename>counter.gmt</filename> in your catalog root directory.
<programlisting>
[counter file=counter.loc date=1]
[counter file=counter.gmt date=gmt]
</programlisting>
__END__



__NAME__ example: Counter using steps of +2 and -2, with in-place subroutine specification
The following creates two counter files,
<filename>counter.p2</filename> and
<filename>counter.m2</filename> in your catalog root directory.
Counters initially start at <literal>20</literal>; one adds
<literal>2</literal> and one subtracts <literal>2</literal> each time
they're called.
<programlisting>
[counter
  file=counter.p2
  start=20
  inc-routine=`sub { shift(@_) + 2 }`
]
[counter
  file=counter.m2
  start=20
  decrement=1
  dec-routine=`sub { shift(@_) - 2 }`
]
</programlisting>
__END__



__NAME__ example: Counter using steps of +3 and -3, with Sub or GlobalSub routine specification
The following creates two counter files,
<filename>counter.p3g</filename> and
<filename>counter.m3g</filename> in your catalog root directory.
Counters initially start at <literal>20</literal>; one adds
<literal>3</literal> and one subtracts <literal>3</literal> each time
they're called.
</para><para>
You need the following in &ccf; or &gcf;:
<programlisting><![CDATA[
Sub three_steps_forward <<EOR
sub {
  my $val = shift; $val += 3; return $val;
}
EOR

Sub three_steps_back <<EOR
sub {
  my $val = shift; $val -= 3; return $val;
}
EOR
]]></programlisting>

<para>
And the following on an &IC; page:
<programlisting>
[counter file=counter.p3 start=20 inc-routine=three_steps_forward ]
[counter file=counter.m3 start=20 decrement=1 dec-routine=three_steps_back]
</programlisting>
__END__



__NAME__ example: PostgreSQL database counter
Create sequence <literal>counter1</literal> in the database:
<programlisting>
CREATE SEQUENCE "counter1" start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
</programlisting>
And use the counter on your pages:
<programlisting>
[counter sql="table1:counter1"]
</programlisting>
__END__

__NAME__ example: MySQL database counter
Create table <database>table2</database> and a sequence <literal>counter2</literal> in that database:
<programlisting>
create table table2(counter2 int NOT NULL AUTO_INCREMENT PRIMARY KEY);
</programlisting>
And use the counter on your pages:
<programlisting>
[counter sql="table2:counter2"]
</programlisting>
__END__

__NAME__ example: Oracle database counter
Create a sequence <literal>counter3</literal> in the database:
<programlisting>
CREATE SEQUENCE counter3 START WITH 1 INCREMENT BY 1 MAXVALUE 2147483647 MINVALUE 1 CACHE 2;
</programlisting>
And use the counter on your pages:
<programlisting>
[counter sql="table3:counter3"]
</programlisting>
__END__


