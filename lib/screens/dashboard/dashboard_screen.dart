import 'package:admin/components/header/component.header.dart';
import 'package:admin/screens/dashboard/component.gender_imc.dart';
import 'package:admin/screens/dashboard/component.hipertencion_alert.dart';
import 'package:admin/screens/dashboard/component.imc_by_year.dart';
import 'package:admin/screens/dashboard/component.overweight.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'component.overweight.dart';

import '../../../constants.dart';
import 'component.medic_records.dart';
import 'component.imc_by_faculty.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  
  late bool isExpanded;

  @override
  void initState() {
    isExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        // vertical: defaultPadding + size.height * 0.115, 
        horizontal: defaultPadding
      ),
      child: Column(
        children: [
          SizedBox(height: defaultPadding),
          Header(size: Size(size.width, size.height * 0.1)),
          SizedBox(height: defaultPadding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MedicRecordsComponent(
                size: Size(size.width * 0.2, size.height),
              ),
              SizedBox(
                width: defaultPadding,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IMCByYearComponent(
                    size: Size(size.width * 0.40, size.height * 0.35),
                  ),
                  SizedBox(height: 10.0,),
                  GenderIMCComponent(
                    size: Size(
                      MediaQuery.of(context).size.width * 0.40,
                      MediaQuery.of(context).size.height * 0.35
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: defaultPadding,
              ),
              Column(
                children: [
                  GaugeChart(
                    size: Size(size.width * 0.35, size.height * 0.4),
                  ),
                  SizedBox(height: 10.0,),
                  HypertensionAlert(size: Size(size.width * 0.35, size.height * 0.4))
                ],
              )
            ],
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IMCByFacultyComponent(
                size: Size(
                  MediaQuery.of(context).size.width * 0.9,
                  MediaQuery.of(context).size.height * 0.5
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}