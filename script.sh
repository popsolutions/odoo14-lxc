#! /usr/bin/bash
odoo_v=14.0
yes=yes
no=no
l10n_brazil_is=yes
account_invoice_reporting=yes
account_invoicing=yes
account_payment=yes
backend_theme=yes
contract=yes
field_service=yes
geospatial=yes
helpdesk=yes
knowledge=yes
maintenance=yes
management_system=yes
project=yes
server_tools=yes
social=yes
stock_logistics_warehouse=yes
stock_logistics_workflow=yes
timesheet=yes
web=yes
website=yes

echo ""
echo "Odoo installation script for LXC/LXD and TKL Containers"
echo "Odoo Community Association module installation assistant"
echo "Developed by PopSolutions.Co"
echo ""
echo ""
read -p "Choose an Odoo Version for your OCA Modules assistant (default=14.0)" odoo_v

if [ "$odoo_v" = "" -o "$odoo_v" = "14" -o "$odoo_v" = "14.0" ]; then
	odoo_v=14.0
elif [ "$odoo_v" = "12" -o "$odoo_v" = "12.0" ]; then
        odoo_v=12.0
fi

echo "OCA Modules to be installed v="$odoo_v
read -p "Whould you like to install l10n-brazil? (default=yes)" l10n_brazil_is

if [ "$l10n_brazil_is" = "yes" -o "$l10n_brazil_is" = "Yes" -o "$l10n_brazil_is" = "YES" -o "$l10n_brazil_is" = "y" -o "$l10n_brazil_is" = "Y" ]; then
	git clone https://github.com/oca/l10n-brazil -b $odoo_v
	echo "l10n-brazil repo retrivied, installing packages and preparing for installation"
	apt-get install build-essential libssl-dev libffi-dev python3-dev gcc
	echo "l10n-brazil packages Installed Sucessfully!"
	cd l10n-brazil
	pip3 install -r requirements.txt
	cd ..
else
	echo "Jumping l10n-brazil installation"
fi
echo ""
echo ""
read -p "Whould you like to install Account Invoice Reporting? (default=yes)" account_invoice_reporting

if [ "$account_invoice_reporting" = "yes" -o "$account_invoice_reporting" = "Yes" -o "$account_invoice_reporting" = "YES" -o "$account_invoice_reporting" = "y"	-o "$account_invoice_reporting" = "Y" ]; then
        git clone https://github.com/oca/account-invoice-reporting -b $odoo_v
        echo "account_invoice_reporting repo retrivied, and installed"
else
        echo "Jumping account-invoice-reporting installation"
fi

##GeoEspatial
echo ""
echo ""
read -p "Whould you like to install Geoespatial Enfine (default=yes)" geoespatial

if [ "$geoespatial" = "yes" -o "$geoespatial" = "Yes" ]; then
        git clone https://github.com/oca/geoespatial -b $odoo_v
        echo "account_invoice_reporting repo retrivied, and installed"
	cd geoespatial
	pip3 install -r requirementxt.txt
else
        echo "Jumping account-invoice-reporting installation"
fi



