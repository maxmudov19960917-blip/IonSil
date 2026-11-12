# IonSil

**IonSil** is a browser-based calculator for metal-ion implantation into silicon and ion-beam synthesis of metal silicides (MSi₂).
It computes the projected range Rp and straggling ΔRp (ZBL nuclear and Lindhard–Scharff electronic stopping), the sputtering yield
(Sigmund theory) and the sputter-limited implant profile (Schulz–Wittmaack analytical solution). From these it estimates the peak
metal fraction, the sputter-limited saturation limit 1/Y and the dose required for MSi₂ stoichiometry.

*IonSil — kremniyga metall ionlari implantatsiyasi va silitsid sintezini hisoblash dasturi (o'zbek tilidagi interfeys).*

## Usage

No installation is needed. Download `IonSil.html` (or `index.html`) and open it in any modern web browser.
The program runs entirely in the browser; no data is sent anywhere.

**Language / Til:** the interface is available in **English** and **Uzbek**. Use the `UZ | EN` switch in the top-right corner,
or add `?lang=en` / `?lang=uz` to the address. `index.html` opens in English by default, `IonSil.html` in Uzbek.

## Contents

| Path | Description |
|---|---|
| `IonSil.html` | The program (single self-contained HTML file, v2.0); Uzbek by default |
| `index.html` | Same program, English by default (used by GitHub Pages) |
| `validation/SRIM2013/` | Raw SRIM-2013 / TRIM outputs used for the code-to-code comparison in the paper |

## Validation data (SRIM-2013 / TRIM)

`validation/SRIM2013/` contains the unmodified output files used to compare IonSil with SRIM-2013:

- `1_SR_Module_Rp_dRp/` — SR Module stopping/range tables for 11 ions in Si (10 keV – 10 MeV).
  Note: the SR Module bundled with the SRIM-2013 package labels itself *SRIM-2012.01*.
- `2_TRIM_purkash/` — TRIM (SRIM-2013.00) sputtering runs: `SPUTTER_<ion>_<E keV>.txt` and `TDATA_<ion>_<E keV>.txt`.
- `3_kirish_fayllari/` — example `SR.IN` / `TRIM.IN` input files and the batch script.
- `TRIM_purkash_jamlanma.csv`, `SR_Module_100keV_jamlanma.csv` — summary tables.

TRIM settings: "Monolayer collision steps / Surface sputtering", 1000 ions per run, normal incidence, amorphous Si
(2.3212 g/cm³), surface binding energy 4.7 eV, displacement energy 15 eV, lattice binding energy 2 eV.
Sputtering yield Y = (number of lines starting with `S` in SPUTTER file) / 1000; statistical error ≈ √S / 1000.

SRIM is © J.F. Ziegler (www.srim.org); only its output files are included here.

## Citation

If you use IonSil, please cite:

M.A. Makhmudov, Z.A. Isakhanov. *Sputter-limited stoichiometry in ion-beam synthesis of transition-metal disilicides: analytical model, SRIM-2013/TRIM benchmark and comparison with experiments* (manuscript submitted, 2026).

## Authors

M.A. Makhmudov — Islam Karimov Tashkent State Technical University, Tashkent, Uzbekistan  
Z.A. Isakhanov — U.A. Arifov Institute of Ion-Plasma and Laser Technologies, Academy of Sciences of Uzbekistan, Tashkent

## License

MIT — see `LICENSE`.
