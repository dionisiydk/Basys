I represent local peer inside Basys network.

I only responsible to supply identificator of current local peer. it value should be used to identify new incomming connections.
I use UUID for that purpose.

Concrete network implementations can use me and remote peers polymorphically by implementing required behaviour on both classes.