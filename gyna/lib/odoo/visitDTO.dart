import 'package:flutter/cupertino.dart';
import 'package:gyna/assets/custom_widget.dart';
import 'package:object_mapper/object_mapper.dart';

import 'itemsDTO.dart';

class VisitDTO with Mappable {
  static String model = "gyn.clinic.visit";

  var date = TextEditingController(text: '');
  ItemsDTO selectedPatientSearch = new ItemsDTO();
  List<ItemsDTO> listPatientSearch = [];
  var fee = TextEditingController(text: '');

  ///////////////CONTROLLERS FOR GAYNOCOLOGY//////////////////////////////////////
  var gynaDate = TextEditingController(text: '');
  var controllerTemp = TextEditingController(text: '');
  var controllerBloodPressure = TextEditingController(text: '');
  var controllerWeight = TextEditingController(text: '');
  var controllerCO = TextEditingController(text: '');
  var controllerThick = TextEditingController(text: '');

  SelectedDropDown uT1 = new SelectedDropDown(listDrop: ['n_s','bulky','irregular']);
  SelectedDropDown uT2 = new SelectedDropDown(listDrop: ['avf' , 'rvfi','rvfii','rvfiii']);
  SelectedDropDown end = new SelectedDropDown(listDrop:['intact' , 'irregular','loop'] );
  SelectedDropDown ovAdhesions = new SelectedDropDown(listDrop: ['yes','no']);
  SelectedDropDown ovSize = new SelectedDropDown(listDrop: ['normal','small','pco']);

  var controllerMyumaSubmucusNo = TextEditingController(text: '');
  var controllerMyumaSubmucusSize = TextEditingController(text: '');
  var controllerInterstitiolNo = TextEditingController(text: '');
  var controllerInterstitiolSize = TextEditingController(text: '');
  var controllerSubserousNo = TextEditingController(text: '');
  var controllersubSerousSize = TextEditingController(text: '');
  var controllerAdenomyosis = TextEditingController(text: '');
  var controllerCervix = TextEditingController(text: '');
  SelectedDropDown tubes = new SelectedDropDown(listDrop: ['normal','hydro']);
  var controllerDp = TextEditingController(text: '');
  var controllerEchogenicity = TextEditingController(text: '');

/////////////////////////////////////////////////////////////////////////////////
//

  //<<<<<<<<CONTROLLERS FOR OBSTETRIC>>>>>>>>>>>>
  SelectedDropDown gender = new SelectedDropDown(listDrop: ['male' , 'female']);
  SelectedBoolField spontaneous = new SelectedBoolField();
  SelectedBoolField cho = new SelectedBoolField();
  SelectedBoolField iui = new SelectedBoolField();
  SelectedBoolField icsi = new SelectedBoolField();

  var lMPObstetric = TextEditingController(text: '');
  var eT = TextEditingController(text: '');
  var edd = TextEditingController(text: '');

  var controllerGAge = TextEditingController(text: '');
  var controllerGravida = TextEditingController(text: '');
  SelectedDropDown Infertility = new SelectedDropDown(listDrop: ['primary', 'secondary']);
  var Infertility2 = TextEditingController(text: '');

  var controllerPara = TextEditingController(text: '');
  var controllerAbortion = TextEditingController(text: '');
  var controllerNVD = TextEditingController(text: '');
  var controllerCs = TextEditingController(text: '');
  var controllerPreTerm = TextEditingController(text: '');
  var controllerEctopic = TextEditingController(text: '');

  SelectedDropDown bloodGroup = new SelectedDropDown(listDrop: ['a','b','o','ab']);
  SelectedDropDown rhType = new SelectedDropDown(listDrop: ['positive','negative']);
  SelectedDropDown antiBodiesTitle = new SelectedDropDown(listDrop: ['+','-']);


  SelectedDropDown texoPlasma1gg = new SelectedDropDown(listDrop: ['positive','negative']);
  SelectedDropDown texoPlasma1gm = new SelectedDropDown(listDrop: ['positive','negative']);
  SelectedDropDown rubella1gg = new SelectedDropDown(listDrop: ['positive','negative']);
  SelectedDropDown rubella1gm = new SelectedDropDown(listDrop: ['positive','negative']);


  SelectedDropDown hcv = new SelectedDropDown(listDrop:['positive','negative'] );
  var controllerNotes = TextEditingController(text: '');

  var controllerWeightObstetric = TextEditingController(text: '');
  var controllerFetalWeight = TextEditingController(text: '');
  var controllerBloodPressureObstetric = TextEditingController(text: '');
  SelectedBoolField viability = new SelectedBoolField();

  var controllerCBC = TextEditingController(text: '');
  var controllerFbc = TextEditingController(text: '');
  var controllerPP = TextEditingController(text: '');

  SelectedDropDown placentaPosition = new SelectedDropDown(listDrop: ['low_lying','anterior','posterior','fundal','previa_complete','previa_partial']);
  SelectedDropDown placentaGrading = new SelectedDropDown(listDrop: ['1','2','3','4']);
  var controllerColorDoppler = TextEditingController(text: '');
  SelectedDropDown amnioticFluid = new SelectedDropDown(listDrop: ['adquate','moderate','dimineshed','nil','polyhdramnions+','polyhdramnions++','polyhdramnions+++']);
  SelectedDropDown presentation = new SelectedDropDown(listDrop: ['cephalic_doa','cephalic_dop','cephalic_dot','moderate','breach_sp','breach_sa','transverse','unstable']);
  var controllerOtherFindings = TextEditingController(text: '');

////////////////////////////////////////////////////////////////////////////////
  //////////////////CONTROLLERS FOR REQUEST/////////////////////////
  var controllerLabCategory = TextEditingController(text: '');
  SelectedDropDown labRequest = new SelectedDropDown();
  SelectedDropDown radiologyRequest = new SelectedDropDown();
  SelectedDropDown pathologyRequest = new SelectedDropDown();

////////////////////////////////////////////////////////////////////////////////
  /////////////////CONTROLLERS FOR PRESCRIPTION///////////////////////
  var controllerMedication = TextEditingController(text: '');

////////////////////////////////////////////////////////////////////////////////
  //////////////////CONTROLLERS FOR SUMMARY////////////////////////
  var visitDate = TextEditingController(text: '');
  var lmpSummary = TextEditingController(text: '');
  var eed = TextEditingController(text: '');

  var controllerLastWeight = TextEditingController(text: '');
  var controllerLastPresent = TextEditingController(text: '');
  var controllerLastFWeight = TextEditingController(text: '');
  var controllerGravidaSummary = TextEditingController(text: '');
  var controllerParaSummary = TextEditingController(text: '');
  var controllerBloodGroup = TextEditingController(text: '');
  var controllerRhType = TextEditingController(text: '');

  // var controllerMarriedDate = TextEditingController(text: '');

  @override
  void mapping(Mapper map) {
    if (date.text != '') {
      map("date", date.text, (v) => date.text = v);
    }
    map("patient_id", selectedPatientSearch.id, (v) => selectedPatientSearch.id = v);
    map("fees", fee.text, (v) => fee.text = v);



    if (gynaDate.text != '') {
      map("gaynecology_date", gynaDate.text, (v) => gynaDate.text = v);
    }

    map("gaynecology_blood_pressure_high", controllerBloodPressure.text,
        (v) => controllerBloodPressure.text = v);
    map("gaynecology_temp", controllerTemp.text, (v) => controllerTemp.text = v);
    map("gaynecology_weight", controllerWeight.text, (v) => controllerWeight.text = v);
    map("gaynecology_c_o", controllerCO.text, (v) => controllerCO.text = v);
    map("gaynecology_thick", (controllerThick.text != '') ? int.parse(controllerThick.text) : 0,
        (v) => controllerThick.text = v.toString());

    map("gaynecology_u_t_1", uT1.valueDrop, (v) => uT1.valueDrop = v);
    map("gaynecology_u_t_2", uT2.valueDrop, (v) => uT2.valueDrop = v);
    map("gaynecology_end", end.valueDrop, (v) => end.valueDrop = v);
    map("gaynecology_ov_adhesions", ovAdhesions.valueDrop, (v) => ovAdhesions.valueDrop = v);
    map("gaynecology_ov_size", ovSize.valueDrop, (v) => ovSize.valueDrop = v);

    map("gaynecology_myuma_submucus_no", controllerMyumaSubmucusNo.text,
        (v) => controllerMyumaSubmucusNo.text = v);
    map("gaynecology_myuma_submucus_size", controllerMyumaSubmucusSize.text,
        (v) => controllerMyumaSubmucusSize.text = v);
    map("gaynecology_interstitiol_no", controllerInterstitiolNo.text,
        (v) => controllerInterstitiolNo.text = v);
    map("gaynecology_interstitiol_size", controllerInterstitiolSize.text,
        (v) => controllerInterstitiolSize.text = v);
    map("gaynecology_subserous_no", controllerSubserousNo.text,
        (v) => controllerSubserousNo.text = v);
    map("gaynecology_subserous_size", controllersubSerousSize.text,
        (v) => controllersubSerousSize.text = v);
    map("gaynecology_adenomyosis", controllerAdenomyosis.text,
        (v) => controllerAdenomyosis.text = v);
    map("gaynecology_cervix", controllerCervix.text, (v) => controllerCervix.text = v);
    map("gaynecology_tubes", tubes.valueDrop, (v) => tubes.valueDrop = v); //*****
    map("gaynecology_d_p", controllerDp.text, (v) => controllerDp.text = v);
    map("echogenicity", controllerEchogenicity.text, (v) => controllerEchogenicity.text = v);

    map("obestatric_gender", gender.valueDrop, (v) => gender.valueDrop = v);
    map("obestatric_spontaneous", spontaneous.boolValue, (v) => spontaneous.boolValue = v);
    map("obestatric_cho", cho.boolValue, (v) => cho.boolValue = v);
    map("obestatric_iui", iui.boolValue, (v) => iui.boolValue = v);
    map("obestatric_icsi", icsi.boolValue, (v) => icsi.boolValue = v);

    if (lMPObstetric.text != '') {
      map("obestatric_lmp", lMPObstetric.text, (v) => lMPObstetric.text = v);
    }
    if (eT.text != '') {
      map("obestatric_et", eT.text, (v) => eT.text = v);
    }
    if (edd.text != '') {
      map("obestatric_edd", edd.text, (v) => edd.text = v);
    }
    map("obestatric_age", controllerGAge.text, (v) => controllerGAge.text = v);
    map("obestatric_gravida", controllerGravida.text, (v) => controllerGravida.text = v);
    map("obestatric_Infertility_1", Infertility.valueDrop, (v) => Infertility.valueDrop = v);
    map("obestatric_Infertility_2", Infertility2.text, (v) => Infertility2.text = v);

    map("obestatric_para", controllerPara.text, (v) => controllerPara.text = v);
    map("obestatric_abortion", controllerAbortion.text, (v) => controllerAbortion.text = v);
    map("obestatric_nvd", controllerNVD.text, (v) => controllerNVD.text = v);
    map("obestatric_cs", controllerCs.text, (v) => controllerCs.text = v);
    map("obestatric_preterm", controllerPreTerm.text, (v) => controllerPreTerm.text = v);
    map("obestatric_ectopic", controllerEctopic.text, (v) => controllerEctopic.text = v);

    map("obestatric_blood_group", bloodGroup.valueDrop, (v) => bloodGroup.valueDrop = v);
    map("obestatric_rh_type", rhType.valueDrop, (v) => rhType.valueDrop = v);
    map("obestatric_antibodies_title", antiBodiesTitle.valueDrop,
        (v) => antiBodiesTitle.valueDrop = v);

    map("obestatric_toxoplasma_1gG", texoPlasma1gg.valueDrop, (v) => texoPlasma1gg.valueDrop = v);
    map("obestatric_toxoplasma_1gM", texoPlasma1gm.valueDrop, (v) => texoPlasma1gm.valueDrop = v);
    map("obestatric_rubellla_1gG", rubella1gg.valueDrop, (v) => rubella1gg.valueDrop = v);
    map("obestatric_rubellla_1gM", rubella1gm.valueDrop, (v) => rubella1gm.valueDrop = v);

    map("obestatric_hcv", hcv.valueDrop, (v) => hcv.valueDrop = v);
    map("obestatric_notes", controllerNotes.text, (v) => controllerNotes.text = v);

    map("obestatric_date_weight", controllerWeightObstetric.text,
        (v) => controllerWeightObstetric.text = v);
    map("obestatric_weight", controllerFetalWeight.text, (v) => controllerFetalWeight.text = v);
    map("obestatric_blood_pressure_high", controllerBloodPressureObstetric.text,
        (v) => controllerBloodPressureObstetric.text = v);
    map("obestatric_viability", viability.boolValue, (v) => viability.boolValue = v);

    map("obestatric_cbc", controllerCBC.text, (v) => controllerCBC.text = v);
    map("obestatric_fbc", controllerFbc.text, (v) => controllerFbc.text = v);
    map("obestatric_pp", controllerPP.text, (v) => controllerPP.text = v);

    map("obestatric_placenta_position", placentaPosition.valueDrop,
        (v) => placentaPosition.valueDrop = v);
    map("obestatric_placenta_grading", placentaGrading.valueDrop,
        (v) => placentaGrading.valueDrop = v);
    map("obestatric_color_doppler", controllerColorDoppler.text,
        (v) => controllerColorDoppler.text = v);
    map("obestatric_amniotic_fluid", amnioticFluid.valueDrop, (v) => amnioticFluid.valueDrop = v);
    map("obestatric_presentation", presentation.valueDrop, (v) => presentation.valueDrop = v);
    map("obestatric_other_findings", controllerOtherFindings.text,
        (v) => controllerOtherFindings.text = v);

    // map("category_ids", date, (v) => date = v);
    // map("lab_request_id", date, (v) => date = v);
    //
    // map("radiology_request_ids", date, (v) => date = v);
    // map("pathology_request_id", date, (v) => date = v);
    //
    // map("pathology_request_id", date, (v) => date = v);
    //
    // map("medication_id", date, (v) => date = v);
    //
    if (visitDate.text != '') {
      map("summary_date", visitDate.text, (v) => visitDate.text = v);
    }
    if (lmpSummary.text != '') {
      map("summary_lmp", lmpSummary.text, (v) => lmpSummary.text = v);
    }
    if (eed.text != '') {
      map("summary_edd", eed.text, (v) => eed.text = v);
    }

    map("summary_last_weight", controllerLastWeight.text, (v) => controllerLastWeight.text = v);
    map("summary_last_present", controllerLastPresent.text, (v) => controllerLastPresent.text = v);
    map("summary_last_f_weight", controllerLastFWeight.text, (v) => controllerLastFWeight.text = v);
    map("summary_gravida", controllerGravidaSummary.text, (v) => controllerGravidaSummary.text = v);
    map("summary_para", controllerParaSummary.text, (v) => controllerParaSummary.text = v);
    map("summary_blood_group", controllerBloodGroup.text, (v) => controllerBloodGroup.text = v);
    map("summary_rh_type", controllerRhType.text, (v) => controllerRhType.text = v);
  }
}
