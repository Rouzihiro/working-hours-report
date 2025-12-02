# Working Hours Documentation System

A professional, self-contained Typst template system for automated working hours tracking and reporting. Generate clean, formatted monthly reports from CSV data with one command.

## Features

- **One-Command Generation** - Full PDF reports with `make month`
- **Professional Tables** - Alternating colors, checkboxes, automatic numbering
- **CSV Data Integration** - Import working hours from spreadsheet exports
- **No External Dependencies** - Pure Typst & Python, no complex setup
- **German Formatting** - Optimized for medical/documentation standards
- **Flexible Templates** - Easily customizable colors, fonts, layouts
- **Multi-Language Support** - German & English templates included

## Quick Start

Clone the repository:
git clone https://github.com/Rouzihiro/working-hours-report.git
cd working-hours-report

Generate example report (English):
make test

Generate your monthly report (German):
make month

Clean generated files:
make clean

Output: output/monthly.pdf (your report) or output/example.pdf (demo)

## Project Structure

working-hours-report/
├── templates/
│   ├── monthly-template.typ   
│   ├── monthly-template-en.typ
│   └── monthly-report.typ    
├── example/
│   ├── variables.py        
│   └── 01.2026.csv         
├── lib/
│   └── working-hours.typ  
├── assets/               
├── data/                
└── output/                     

## Configuration

### 1. Set Your Variables
Edit variables.py:
VARIABLES = {
    "DEPARTEMENT": "Unfallchirurgie, Orthopädie und Sporttraumatologie",
    "EMPLOYE_NAME": "Your Name",
    "CITY": "Your City",
    "DATE": "31.12.2025"  # Report date
}

### 2. Add Your Data
Place CSV files and create symlinks:
Example: Link your December 2025 data
ln -s /path/to/your/data.csv data/12.2025.csv

CSV Format:
Datum,Wochentag,Arbeitszeit,Arbeitsstunden,Bemerkungen
01.12.2025,Montag,,1h,mobiles Arbeiten
02.12.2025,Dienstag,10:00 - 13:30,3.5h,
...

### 3. Customize Templates
Edit templates/monthly-template.typ for:
- Layout adjustments
- Color schemes (luma(245) for light gray)
- Font changes ("Victor Mono")
- Header/footer content

## Advanced Usage

### Watch Mode (Live Preview)
Watch German template
make watch-monthly

Watch English template  
make watch-test

### Manual Generation
Generate Typst file only
python variables.py

Compile manually
typst compile templates/monthly-report.typ output/custom.pdf

### Example Data
Test with included example data:
make test  # Uses example/variables.py and example/01.2026.csv

## Requirements

- Typst (PDF generation)
- Python 3.6+ (variable substitution)

### Install Typst
macOS/Linux
curl --proto '=https' --tlsv1.2 -sSfL https://raw.githubusercontent.com/typst/typst/main/install.sh | sh

Windows (Winget)
winget install --id Typst.Typst

Windows (Scoop)
scoop install typst

## CSV Format Reference

Column: Datum
Required: Yes
Example: 01.12.2025
Description: Date (DD.MM.YYYY)

Column: Wochentag
Required: Yes
Example: Montag
Description: Weekday in German

Column: Arbeitszeit
Required: No
Example: 10:00 - 13:30
Description: Time range (optional)

Column: Arbeitsstunden
Required: Yes
Example: 3.5h
Description: Hours worked

Column: Bemerkungen
Required: No
Example: mobiles Arbeiten
Description: Notes/comments

## Customization

### Change Colors
In templates/monthly-template.typ:
#set text(fill: rgb("#2d3748"))  // Text color
#block(fill: luma(245))          // Background color

### Change Font
#set text(font: "Inter", weight: 400)  // Modern font

### Modify Table Layout
Edit lib/working-hours.typ for:
- Column widths
- Border styles
- Alternating row colors
- Checkbox appearance

## Contributing

1. Fork the repository
2. Create a feature branch (git checkout -b feature/improvement)
3. Commit changes (git commit -m 'Add some feature')
4. Push to branch (git push origin feature/improvement)
5. Open a Pull Request

## License

MIT License - see LICENSE for details.

## Acknowledgments

- Built with Typst - The next-generation document compiler
- Inspired by German medical documentation standards
- Designed for clarity and professional presentation

Quick Reference:
make help      # Show all commands
make test      # Generate example report
make monthly   # Generate your report
make clean     # Remove generated files

Star this repo if you find it useful!
