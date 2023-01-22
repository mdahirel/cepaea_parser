# A parser for *Cepaea* colour data

*Cepaea* snails have been used as models in evolutionary biology a lot, in no small part due to their shell colour polymorphism, which is (almost) entirely driven by genetic variation, with no substantiated evidence of phenotypic plasticity so far.  

*Cepaea* shell phenotype is often recorded using a standard shorthand notation that conveys information about background colour, number of bands and their location, presence of band fusions...  

This is a WIP attempt at writing a parser function, that takes a vector of *Cepaea* phenotypes written using standard notation and gives back specific information in separate columns for further analyses.

When finalized, this parser will follow the *Cepaea* morph notation as synthesized in Cain (1988). The scoring of polymorphic colour and pattern variation ans its genetic basis in molluscan shells. *Malacologia*, 28(1-2), 1-15, available in the Biodiversity Heritage Library at https://www.biodiversitylibrary.org/item/47000#page/12/mode/1up

**To do list**

- more tests to catch ill-formed strings
- add an "effectively unbanded" variable?
- other traits?
- ...
