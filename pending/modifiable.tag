Quoting Mike Heins (mheins@redhat.com):
> Quoting Stefan Hornburg (Racke) (racke@linuxia.de):
> > Yes, I already noticed that problems for variables while upgrading
> > Interchange on http://www.passionshop.com/ from 4.6.x/LINUXIA
> > to 4.8.x.
> > 
> > Now I have a really ugly hack for some of the variables.
> > Do you have a recommendation for variables to be removed for
> > the current page and reappearing on the next page ?
> > 
> 
> Yes, I was going to make a $Tag->modifiable($thing), but I haven't 
> figured that out yet. Your hack stands for the moment, this doesn't
> work:
>  
> 
> But this does. 8-) Forgot the pre-copied refs....
> 

Here is a simpler version:


UserTag modifiable Order thing
UserTag modifiable Routine <<EOR
require Tie::ShadowHash;
sub {
	my $thing = shift || 'Variable';
	my $ref = $Vend::Cfg->{$thing};
	return undef if ref($ref) ne 'HASH';

	my %hash;
	tie %hash, 'Tie::ShadowHash', $ref;

	my $new = \%hash;
	$Vend::Cfg->{$thing} = $new;

	if($thing eq 'Variable') {
		$::Variable = $Vend::Interpolate::Variable = $new;
	}

	return "$thing set to modifiable";
}
EOR

And a test page (needs "Variable FOO bar" in catalog.cfg):

FOO=__FOO__<br>
FOO=[var FOO]<br>
[modifiable]<br>
Set...[calc] $Variable->{FOO} = 'hosed'; [/calc]<br>
FOO=[var FOO]


-- 

So I need to call $Tag->modifiable('') before fiddling with the
variable values in every AutoLoad ?
