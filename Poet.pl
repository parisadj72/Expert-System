/*   برای اجرا کافیست این فایل را با دوبار کلیک کردن باز کنید. */


start:- write('پس از وارد کردن هر ورودي، "." بگذاريد.'),nl,nl,
	write('به دنبال شاعر خاصي مي گرديد؟ عدد 1 را وارد کنيد.'),nl,
	write('مشخصات شاعر خاصي را مي خواهيد ببينيد؟ عدد 2 را وارد کنيد.'),nl,
	write('خروج؟ عدد 0'),nl,
	read(Order),check_order(Order).

check_order(0):-
	tell('kb.pl'),listing(gharn),listing(sabk),listing(asar),told.

check_order(1):-
	write('در چه قرني مي زيسته؟'), read(Gharn),
	write('يک اثر از او نام ببريد'), read(Asar),
	write('قالب اشعارش ؟'), read(Sabk),nl,
	find(Gharn,Asar,Sabk).


check_order(2):-
	write_names.

check_order(X):-
	(X>2), write('ورودي نامعتبر! '),nl,nl,start.

write_names:-
	gharn(Name,Gharn), asar(Name,Asar),sabk(Name,Sabk),
	nl,write('نام شاعر:'), write(Name),nl,
	write('قرن:'),write(Gharn),nl,
	write('آثار:'), write(Asar),nl,
	write('قالب اشعار:'), write(Sabk),nl,write('*****'),nl,
	fail.


find(Gharn,Asar,Sabk) :-
	gharn(X,Gharn), asar(X,Asar),sabk(X,Sabk),nl,nl,
	write('شاعر مورد نظر شما: '), write(X),nl,write('********'),nl,start.

find(Gharn,Asar,Sabk):-
	write('نميشناسم! لطفا نامش را بگو :'),nl,nl,
	read(Name),
	delete_fact(gharn(Name,Gharn)),
	delete_fact(asar(Name,Asar)),
	delete_fact(sabk(Name,Sabk)),

	assertz(gharn(Name,Gharn)),
	assertz(asar(Name,Asar)),
	assertz(sabk(Name,Sabk)),
	write('با موفقيت افزوده شد. سپاسگزارم' ),nl,write('********'),nl,
	start.


delete_fact(Fact):-
	not(Fact),true.

delete_fact(Fact):-
	retract(Fact).

:-['kb.pl'],start.
