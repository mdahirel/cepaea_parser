# A parser for *Cepaea* colour data

*Cepaea* snails have been used as models in evolutionary biology a lot, in no small part due to their shell colour polymorphism, which is (almost?) entirely driven by genetic variation, with no substantiated evidence of phenotypic plasticity so far.  

*Cepaea* shell phenotype is often recorded using a standard shorthand notation that conveys information about background colour, number of bands and their location, presence of band fusions...  

This is a WIP attempt at writing a parser function in R, that takes a vector of *Cepaea* phenotypes written using standard notation and gives back specific information in separate columns for further analyses.

## On allowed morph elements

- There are 3 background colours allowed, yellow `Y`, pink `P` and brown `B`. Modifiers to these colours are allowed: `P` or `L` (for "pale" and "light") to denote lighter colours (e.g. `PB`,`LB`), `D` to denote darker colours (e.g. `DP`). See https://doi.org/10.1038/s41437-019-0189-z for data showing that background colour variation may be better described as continuous; the classical yellow-pink-brown discretization still remains valuable nonetheless, if only for comparisons with historical studies.

- As is usual for *Cepaea* notation, absent bands are denoted by `0` where the band should be; `Y00345` is a valid string for a yellow shell with 3 bands, `Y345` is **not**.

- Punctuate bands are allowed as `:`, and periods `.` can be used as indicator of partial bands, that are only visible just before the lip.

- Band fusions are denoted by parenthese enclosing the relevant bands, e.g. a `(12)(345)` snail has the bands 1 and 2 merged together, and separately the bands 3 to 5 merged together.

- Less common (or less commonly recorded) variations, for which the notation consensus is less obvious, are currently not accounted for. They might or might not be added in the future. For now, they will either ignored or throw `NA`s if introduced, depending on the notation used. This includes lip coloration variation, or less pigmented/unpigmented bands.

## References
The parser takes its rules about *Cepaea* morph notation from:  
 - Cain (1988). The scoring of polymorphic colour and pattern variation and its genetic basis in molluscan shells. *Malacologia*, 28(1-2), 1-15. Available in the Biodiversity Heritage Library at https://www.biodiversitylibrary.org/item/47000#page/13/mode/1up
 - Jackson, Larsson & Davison (2021). Quantitative measures and 3D shell models reveal interactions between bands and their position on growing snail shells. *Ecology and Evolution*, 11: 6634-6648. https://doi.org/10.1002/ece3.7517 

## To-do list

- more tests to catch ill-formed strings (e.g. fusion around absent bands (00)345, or band numbers in wrong order 13425...)
- add an "effectively unbanded" variable to output?
- add other traits to output?
- ...
