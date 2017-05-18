shrink:
	python optimize_html.py MDM-Mouse.html
	python optimize_html.py MDM-Simulations.html
	python optimize_html.py MDM-RSN10.html
	python optimize_html.py MDM-VisMotor.html
	mv MDM-Mouse-optimized.html MDM-Mouse.html
	mv MDM-Simulations-optimized.html MDM-Simulations.html
	mv MDM-RSN10-optimized.html MDM-RSN10.html
	mv MDM-VisMotor-optimized.html MDM-VisMotor.html


