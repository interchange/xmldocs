__NAME__ purpose
retrieve column names from a database table
__END__

__NAME__ synopsis 
<row>

	<entry>
	<group>
		<arg choice='plain'>name</arg>
		<arg choice='plain'>table</arg>
	</group>
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
	Name of the &glos-database; table.
	</entry>

</row> 
<row>

	<entry>
	<group>
		<arg choice='plain'>fields</arg>
		<arg choice='plain'>columns</arg>
	</group>
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
	Manually specify columns to be returned.
	</entry>

</row> 
<row>

	<entry>
	joiner
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>\n</literal>
	</entry>
	<entry>
	String joiner to use if column list is requested in &PERL;
	<literal>scalar</literal> context.
	</entry>

</row> 
<row>

	<entry>
	passed_order
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
	With <literal>columns=</literal>, return columns in the
	passed order instead of table order?
	</entry>

</row> 
&TAG_CONTAINER;
__END__

__NAME__ description
&tag-__FILENAME__; returns the list of columns in a 
&glos-database; table.
__END__

__NAME__ notes
A side effect of specifying <literal>passed_order=1</literal> is the
removal of invalid column names from the <literal>columns=</literal>
list; column names not present in the database table are filtered out,
instead of being returned regardless.
__END__

__NAME__ example: looping over column list from the products table
<programlisting><![CDATA[
<pre>
[loop list="[db-columns products]"]
  Column: [loop-code]
[/loop]
</pre>
]]></programlisting>
__END__

__NAME__ example: looping over column list, without using db_columns
It is possible to list table columns manually without the use of
&tag-db_columns;. The output will be satisfactory as long as  you don't
need db_column's <literal>columns=</literal> attribute.

<programlisting><![CDATA[
[perl tables=products]
  $Scratch->{columns} = join ' ', $Db{products}->columns;
  return;
[/perl]

<pre>
[loop list="[scratch columns]"]
  Column: [loop-code]
[/loop]
</pre>
]]></programlisting>
__END__






From docelic at mail.inet.hr  Thu Nov  4 17:16:15 2004
From: docelic at mail.inet.hr (Davor Ocelic)
Date: Thu Nov  4 17:16:31 2004
Subject: [interchange-core] db_columns UI tag
Message-ID: <20041104231615.2aee658c.docelic@mail.inet.hr>


Hi,

	The db_columns UI tag isn't documented so I can't compare the source
	with intended behavior, but the tag has some problems:

	In this code block:

	if($passed_order) {
		@col{@allcols} = @allcols;
		@allcols = @cols;

		my $found;
		for(@cols) {
			next unless $_ eq $key;
			$found = 1;
			last;
		}
#
		unshift (@allcols, $key) if ! $found;
	}


Everything after the first line (@col{@allcols} = @allcols)
	has no effect on the execution.

	Besides, looks like the tag tries to ensure that $key is
	always included in the set of returned column names, but
	it doesn't succeed in doing so (at least if columns=
			is specified by user).

	Since the docs aren't available, I'd like someone more
	familiar with this to check-in a fix if I'm right.

