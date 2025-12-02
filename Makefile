.PHONY: test monthly clean help

# Test template - generates example from English template
test:
	@echo "🔧 Generating test report..."
	python variables-example.py
	@echo "📄 Compiling example report..."
	typst compile --root . templates/monthly-report.typ --format pdf output/example.pdf
	@echo "✅ Example report: output/example.pdf"

# Monthly report - uses German template with your real data
month:
	@echo "🔧 Generating monthly report..."
	python variables.py
	@echo "📄 Compiling monthly report..."
	typst compile --root . templates/monthly-report.typ --format pdf output/monthly.pdf
	@echo "✅ Monthly report: output/monthly.pdf"

# Clean output
clean:
	@rm -rf output
	@echo "🧹 Cleaned output directory"

# Help
help:
	@echo "Working Hours Report System"
	@echo ""
	@echo "Commands:"
	@echo "  make test    - Generate example (uses example/variables.py)"
	@echo "  make monthly - Generate your monthly report (uses variables.py)"
	@echo "  make clean   - Remove generated PDFs"
	@echo "  make help    - Show this help"
	@echo ""
	@echo "Files generated:"
	@echo "  templates/monthly-report.typ - Always regenerated from template"
	@echo "  output/example.pdf           - Example with test data"
	@echo "  output/monthly.pdf           - Your actual report"
