from pathlib import Path

# Example variables for testing/demo
VARIABLES = {
    "DEPARTEMENT": "Example Department Name",
    "EMPLOYE_NAME": "Joe, Public",
    "CITY": "Example City",
    "DATE": "31.01.2026"
}

def create_typst_report(template_path, output_path, variables):
    """
    Create a Typst report by replacing variables in the template.
    """
    # Read the template
    with open(template_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace all variables
    for var_name, var_value in variables.items():
        placeholder = f"{{{var_name}}}"
        content = content.replace(placeholder, var_value)
    
    # Write the output
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"✅ Example report generated: {output_path}")
    return output_path

if __name__ == "__main__":
    # Always use the English template for examples
    template_file = "templates/monthly-template-en.typ"
    output_file = "templates/monthly-report.typ"
    
    create_typst_report(template_file, output_file, VARIABLES)
    print("\n📝 Generated from: monthly-template-en.typ")
