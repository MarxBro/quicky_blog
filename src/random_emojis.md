# Random Emojis

Algo completamente inútil: __imprimir emojis en la terminal__.

Se puede hacer así:

	printf "\U$(printf '%x' $((RANDOM%79+128512)) )"

> No me acuerdo bien de donde lo saqué. Disuclpas...

	for i in $(seq 1 1000); do printf "\U$(printf '%x' $((RANDOM%79+128512)) )" && echo -n "    "; done

> Ja!

Notar que es necesario una fuente que soporte emojis, como __Droid Sans__ en Arch.
