package com.uestc.hams.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class PhyExam implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String symptom1;
	private String symptom2;
	private Double temper;
	private Integer pulseRate;
	private Integer breathe;
	private Integer leftBpss;
	private Integer leftBpsz;
	private Integer rightBpss;
	private Integer rightBpsz;
	private Double height;
	private Double weight;
	private Double waist;
	private Double BMI;
	private String elderHealth;
	private String elderSelfHelp;
	private String elderPerceive1;
	private Integer elderPerceive2;
	private String elderEmotion1;
	private Integer elderEmotion2;
	private String exerFre;
	private Integer exerTime;
	private Double insTime;
	private String exerWay;
	private String diet;
	private String smoke;
	private Double smokeDay;
	private Integer smokeStart;
	private Integer smokeEnd;
	private String drinkFre;
	private Double drinkDay;
	private String abstinence1;
	private Integer abstinence2;
	private Integer abstinAge;
	private String temulence;
	private String drinkType1;
	private String drinkType2;
	private String lip;
	private String dentition;
	private String pharyngeal;
	private Double leftVision;
	private Double rightVision;
	private Double leftCav;
	private Double rightCav;
	private String hearing;
	private String motorFunction;
	private String eyebase1;
	private String eyebase2;
	private String skin1;
	private String skin2;
	private String sclera1;
	private String sclera2;
	private String lymph1;
	private String lymph2;
	private String barrelChest;
	private String breathSound1;
	private String breathSound2;
	private String rale1;
	private String rale2;
	private Integer heartRate;
	private String heartRhythm;
	private String murmur1;
	private String murmur2;
	private String tendness1;
	private String tendness2;
	private String mass1;
	private String mass2;
	private String hepato1;
	private String hepato2;
	private String splenauxe1;
	private String splenauxe2;
	private String shiftDull1;
	private String shiftDull2;
	private String legEdema;
	private String footPulse;
	private String dre1;
	private String dre2;
	private String breast1;
	private String breast2;
	private String vulva1;
	private String vulva2;
	private String vagina1;
	private String vagina2;
	private String cervix1;
	private String cervix2;
	private String corpus1;
	private String corpus2;
	private String annex1;
	private String annex2;
	private String phyExamElse;
	private Double fbg1;
	private Double fbg2;
	private Double ghb;
	private String hbsag;
	private Double hgb;
	private Double leu;
	private Double plt;
	private String cbcElse;
	private String pro;
	private String uglu;
	private String ket;
	private String bld;
	private String urineElse;
	private Double mau;
	private String bloodStool;
	private Double sgpt;
	private Double sgot;
	private Double alb;
	private Double tbil;
	private Double dbil;
	private Double scr;
	private Double bun;
	private Double potassium;
	private Double sodium;
	private Double chol;
	private Double trig;
	private Double ldlc;
	private Double hdlc;
	private String xray1;
	private String xray2;
	private String bultra1;
	private String bultra2;
	private String ecg1;
	private String ecg2;
	private String smear1;
	private String smear2;
	private String auxiExamElse;
	private String mildPhy;
	private String faintPhy;
	private String yangPhy;
	private String yinPhy;
	private String tanPhy;
	private String muggyPhy;
	private String xueyuPhy;
	private String qiyuPhy;
	private String tebingPhy;
	private String cerebroDis1;
	private String cerebroDis2;
	private String kidneyDis1;
	private String kidneyDis2;
	private String heartDis1;
	private String heartDis2;
	private String vesselDis1;
	private String vesselDis2;
	private String eyeDis1;
	private String eyeDis2;
	private String nervSysDis1;
	private String nervSysDis2;
	private String elseSysDis1;
	private String elseSysDis2;
	private Date examDate;
	private Set<HospitalHistory> hospitalHistorys = new HashSet<HospitalHistory>();//住院史
	private Set<FamilyDisHistory> familyDisHistorys = new HashSet<FamilyDisHistory>();//家庭病床史
	private Set<Medication> medications = new HashSet<Medication>();//主要用药情况
	public Set<FamilyDisHistory> getFamilyDisHistorys() {
		return familyDisHistorys;
	}
	public void setFamilyDisHistorys(Set<FamilyDisHistory> familyDisHistorys) {
		this.familyDisHistorys = familyDisHistorys;
	}
	private ResidentArchive residentArchive;//健康档案
	private User doctor;//责任医生
	private User recorder;//录入员
	
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getSymptom1() {
		return symptom1;
	}
	public void setSymptom1(String symptom1) {
		this.symptom1 = symptom1;
	}
	public String getSymptom2() {
		return symptom2;
	}
	public void setSymptom2(String symptom2) {
		this.symptom2 = symptom2;
	}
	public Double getTemper() {
		return temper;
	}
	public void setTemper(Double temper) {
		this.temper = temper;
	}
	public Integer getPulseRate() {
		return pulseRate;
	}
	public void setPulseRate(Integer pulseRate) {
		this.pulseRate = pulseRate;
	}
	public Integer getBreathe() {
		return breathe;
	}
	public void setBreathe(Integer breathe) {
		this.breathe = breathe;
	}
	public Integer getLeftBpss() {
		return leftBpss;
	}
	public void setLeftBpss(Integer leftBpss) {
		this.leftBpss = leftBpss;
	}
	public Integer getLeftBpsz() {
		return leftBpsz;
	}
	public void setLeftBpsz(Integer leftBpsz) {
		this.leftBpsz = leftBpsz;
	}
	public Integer getRightBpss() {
		return rightBpss;
	}
	public void setRightBpss(Integer rightBpss) {
		this.rightBpss = rightBpss;
	}
	public Integer getRightBpsz() {
		return rightBpsz;
	}
	public void setRightBpsz(Integer rightBpsz) {
		this.rightBpsz = rightBpsz;
	}
	public Double getHeight() {
		return height;
	}
	public void setHeight(Double height) {
		this.height = height;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public Double getWaist() {
		return waist;
	}
	public void setWaist(Double waist) {
		this.waist = waist;
	}
	public Double getBMI() {
		return BMI;
	}
	public void setBMI(Double bMI) {
		BMI = bMI;
	}
	public String getElderHealth() {
		return elderHealth;
	}
	public void setElderHealth(String elderHealth) {
		this.elderHealth = elderHealth;
	}
	public String getElderSelfHelp() {
		return elderSelfHelp;
	}
	public void setElderSelfHelp(String elderSelfHelp) {
		this.elderSelfHelp = elderSelfHelp;
	}
	public String getElderPerceive1() {
		return elderPerceive1;
	}
	public void setElderPerceive1(String elderPerceive1) {
		this.elderPerceive1 = elderPerceive1;
	}
	public Integer getElderPerceive2() {
		return elderPerceive2;
	}
	public void setElderPerceive2(Integer elderPerceive2) {
		this.elderPerceive2 = elderPerceive2;
	}
	public String getElderEmotion1() {
		return elderEmotion1;
	}
	public void setElderEmotion1(String elderEmotion1) {
		this.elderEmotion1 = elderEmotion1;
	}
	public Integer getElderEmotion2() {
		return elderEmotion2;
	}
	public void setElderEmotion2(Integer elderEmotion2) {
		this.elderEmotion2 = elderEmotion2;
	}
	public String getExerFre() {
		return exerFre;
	}
	public void setExerFre(String exerFre) {
		this.exerFre = exerFre;
	}
	public Integer getExerTime() {
		return exerTime;
	}
	public void setExerTime(Integer exerTime) {
		this.exerTime = exerTime;
	}
	public Double getInsTime() {
		return insTime;
	}
	public void setInsTime(Double insTime) {
		this.insTime = insTime;
	}
	public String getExerWay() {
		return exerWay;
	}
	public void setExerWay(String exerWay) {
		this.exerWay = exerWay;
	}
	public String getDiet() {
		return diet;
	}
	public void setDiet(String diet) {
		this.diet = diet;
	}
	public String getSmoke() {
		return smoke;
	}
	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}
	public Double getSmokeDay() {
		return smokeDay;
	}
	public void setSmokeDay(Double smokeDay) {
		this.smokeDay = smokeDay;
	}
	public Integer getSmokeStart() {
		return smokeStart;
	}
	public void setSmokeStart(Integer smokeStart) {
		this.smokeStart = smokeStart;
	}
	public Integer getSmokeEnd() {
		return smokeEnd;
	}
	public void setSmokeEnd(Integer smokeEnd) {
		this.smokeEnd = smokeEnd;
	}
	public String getDrinkFre() {
		return drinkFre;
	}
	public void setDrinkFre(String drinkFre) {
		this.drinkFre = drinkFre;
	}
	public Double getDrinkDay() {
		return drinkDay;
	}
	public void setDrinkDay(Double drinkDay) {
		this.drinkDay = drinkDay;
	}
	public String getAbstinence1() {
		return abstinence1;
	}
	public void setAbstinence1(String abstinence1) {
		this.abstinence1 = abstinence1;
	}
	public Integer getAbstinence2() {
		return abstinence2;
	}
	public void setAbstinence2(Integer abstinence2) {
		this.abstinence2 = abstinence2;
	}
	
	public Integer getAbstinAge() {
		return abstinAge;
	}
	public void setAbstinAge(Integer abstinAge) {
		this.abstinAge = abstinAge;
	}
	public String getTemulence() {
		return temulence;
	}
	public void setTemulence(String temulence) {
		this.temulence = temulence;
	}
	public String getDrinkType1() {
		return drinkType1;
	}
	public void setDrinkType1(String drinkType1) {
		this.drinkType1 = drinkType1;
	}
	public String getDrinkType2() {
		return drinkType2;
	}
	public void setDrinkType2(String drinkType2) {
		this.drinkType2 = drinkType2;
	}
	public String getLip() {
		return lip;
	}
	public void setLip(String lip) {
		this.lip = lip;
	}
	public String getDentition() {
		return dentition;
	}
	public void setDentition(String dentition) {
		this.dentition = dentition;
	}
	public String getPharyngeal() {
		return pharyngeal;
	}
	public void setPharyngeal(String pharyngeal) {
		this.pharyngeal = pharyngeal;
	}
	public Double getLeftVision() {
		return leftVision;
	}
	public void setLeftVision(Double leftVision) {
		this.leftVision = leftVision;
	}
	public Double getRightVision() {
		return rightVision;
	}
	public void setRightVision(Double rightVision) {
		this.rightVision = rightVision;
	}
	public Double getLeftCav() {
		return leftCav;
	}
	public void setLeftCav(Double leftCav) {
		this.leftCav = leftCav;
	}
	public Double getRightCav() {
		return rightCav;
	}
	public void setRightCav(Double rightCav) {
		this.rightCav = rightCav;
	}
	public String getHearing() {
		return hearing;
	}
	public void setHearing(String hearing) {
		this.hearing = hearing;
	}
	public String getMotorFunction() {
		return motorFunction;
	}
	public void setMotorFunction(String motorFunction) {
		this.motorFunction = motorFunction;
	}
	public String getEyebase1() {
		return eyebase1;
	}
	public void setEyebase1(String eyebase1) {
		this.eyebase1 = eyebase1;
	}
	public String getEyebase2() {
		return eyebase2;
	}
	public void setEyebase2(String eyebase2) {
		this.eyebase2 = eyebase2;
	}
	public String getSkin1() {
		return skin1;
	}
	public void setSkin1(String skin1) {
		this.skin1 = skin1;
	}
	public String getSkin2() {
		return skin2;
	}
	public void setSkin2(String skin2) {
		this.skin2 = skin2;
	}
	public String getSclera1() {
		return sclera1;
	}
	public void setSclera1(String sclera1) {
		this.sclera1 = sclera1;
	}
	public String getSclera2() {
		return sclera2;
	}
	public void setSclera2(String sclera2) {
		this.sclera2 = sclera2;
	}
	public String getLymph1() {
		return lymph1;
	}
	public void setLymph1(String lymph1) {
		this.lymph1 = lymph1;
	}
	public String getLymph2() {
		return lymph2;
	}
	public void setLymph2(String lymph2) {
		this.lymph2 = lymph2;
	}
	public String getBarrelChest() {
		return barrelChest;
	}
	public void setBarrelChest(String barrelChest) {
		this.barrelChest = barrelChest;
	}
	public String getBreathSound1() {
		return breathSound1;
	}
	public void setBreathSound1(String breathSound1) {
		this.breathSound1 = breathSound1;
	}
	public String getBreathSound2() {
		return breathSound2;
	}
	public void setBreathSound2(String breathSound2) {
		this.breathSound2 = breathSound2;
	}
	public String getRale1() {
		return rale1;
	}
	public void setRale1(String rale1) {
		this.rale1 = rale1;
	}
	public String getRale2() {
		return rale2;
	}
	public void setRale2(String rale2) {
		this.rale2 = rale2;
	}
	public Integer getHeartRate() {
		return heartRate;
	}
	public void setHeartRate(Integer heartRate) {
		this.heartRate = heartRate;
	}
	public String getHeartRhythm() {
		return heartRhythm;
	}
	public void setHeartRhythm(String heartRhythm) {
		this.heartRhythm = heartRhythm;
	}
	public String getMurmur1() {
		return murmur1;
	}
	public void setMurmur1(String murmur1) {
		this.murmur1 = murmur1;
	}
	public String getMurmur2() {
		return murmur2;
	}
	public void setMurmur2(String murmur2) {
		this.murmur2 = murmur2;
	}
	public String getTendness1() {
		return tendness1;
	}
	public void setTendness1(String tendness1) {
		this.tendness1 = tendness1;
	}
	public String getTendness2() {
		return tendness2;
	}
	public void setTendness2(String tendness2) {
		this.tendness2 = tendness2;
	}
	public String getMass1() {
		return mass1;
	}
	public void setMass1(String mass1) {
		this.mass1 = mass1;
	}
	public String getMass2() {
		return mass2;
	}
	public void setMass2(String mass2) {
		this.mass2 = mass2;
	}
	public String getHepato1() {
		return hepato1;
	}
	public void setHepato1(String hepato1) {
		this.hepato1 = hepato1;
	}
	public String getHepato2() {
		return hepato2;
	}
	public void setHepato2(String hepato2) {
		this.hepato2 = hepato2;
	}
	public String getSplenauxe1() {
		return splenauxe1;
	}
	public void setSplenauxe1(String splenauxe1) {
		this.splenauxe1 = splenauxe1;
	}
	public String getSplenauxe2() {
		return splenauxe2;
	}
	public void setSplenauxe2(String splenauxe2) {
		this.splenauxe2 = splenauxe2;
	}
	public String getShiftDull1() {
		return shiftDull1;
	}
	public void setShiftDull1(String shiftDull1) {
		this.shiftDull1 = shiftDull1;
	}
	public String getShiftDull2() {
		return shiftDull2;
	}
	public void setShiftDull2(String shiftDull2) {
		this.shiftDull2 = shiftDull2;
	}
	public String getLegEdema() {
		return legEdema;
	}
	public void setLegEdema(String legEdema) {
		this.legEdema = legEdema;
	}
	public String getFootPulse() {
		return footPulse;
	}
	public void setFootPulse(String footPulse) {
		this.footPulse = footPulse;
	}
	public String getDre1() {
		return dre1;
	}
	public void setDre1(String dre1) {
		this.dre1 = dre1;
	}
	public String getDre2() {
		return dre2;
	}
	public void setDre2(String dre2) {
		this.dre2 = dre2;
	}
	public String getBreast1() {
		return breast1;
	}
	public void setBreast1(String breast1) {
		this.breast1 = breast1;
	}
	public String getBreast2() {
		return breast2;
	}
	public void setBreast2(String breast2) {
		this.breast2 = breast2;
	}
	public String getVulva1() {
		return vulva1;
	}
	public void setVulva1(String vulva1) {
		this.vulva1 = vulva1;
	}
	public String getVulva2() {
		return vulva2;
	}
	public void setVulva2(String vulva2) {
		this.vulva2 = vulva2;
	}
	public String getVagina1() {
		return vagina1;
	}
	public void setVagina1(String vagina1) {
		this.vagina1 = vagina1;
	}
	public String getVagina2() {
		return vagina2;
	}
	public void setVagina2(String vagina2) {
		this.vagina2 = vagina2;
	}
	public String getCervix1() {
		return cervix1;
	}
	public void setCervix1(String cervix1) {
		this.cervix1 = cervix1;
	}
	public String getCervix2() {
		return cervix2;
	}
	public void setCervix2(String cervix2) {
		this.cervix2 = cervix2;
	}
	public String getCorpus1() {
		return corpus1;
	}
	public void setCorpus1(String corpus1) {
		this.corpus1 = corpus1;
	}
	public String getCorpus2() {
		return corpus2;
	}
	public void setCorpus2(String corpus2) {
		this.corpus2 = corpus2;
	}
	public String getAnnex1() {
		return annex1;
	}
	public void setAnnex1(String annex1) {
		this.annex1 = annex1;
	}
	public String getAnnex2() {
		return annex2;
	}
	public void setAnnex2(String annex2) {
		this.annex2 = annex2;
	}
	public String getPhyExamElse() {
		return phyExamElse;
	}
	public void setPhyExamElse(String phyExamElse) {
		this.phyExamElse = phyExamElse;
	}
	
	public Double getFbg1() {
		return fbg1;
	}
	public void setFbg1(Double fbg1) {
		this.fbg1 = fbg1;
	}
	public Double getFbg2() {
		return fbg2;
	}
	public void setFbg2(Double fbg2) {
		this.fbg2 = fbg2;
	}
	public Double getGhb() {
		return ghb;
	}
	public void setGhb(Double ghb) {
		this.ghb = ghb;
	}
	public String getHbsag() {
		return hbsag;
	}
	public void setHbsag(String hbsag) {
		this.hbsag = hbsag;
	}
	public Double getHgb() {
		return hgb;
	}
	public void setHgb(Double hgb) {
		this.hgb = hgb;
	}
	public Double getLeu() {
		return leu;
	}
	public void setLeu(Double leu) {
		this.leu = leu;
	}
	public Double getPlt() {
		return plt;
	}
	public void setPlt(Double plt) {
		this.plt = plt;
	}
	public String getCbcElse() {
		return cbcElse;
	}
	public void setCbcElse(String cbcElse) {
		this.cbcElse = cbcElse;
	}
	public String getPro() {
		return pro;
	}
	public void setPro(String pro) {
		this.pro = pro;
	}
	public String getUglu() {
		return uglu;
	}
	public void setUglu(String uglu) {
		this.uglu = uglu;
	}
	public String getKet() {
		return ket;
	}
	public void setKet(String ket) {
		this.ket = ket;
	}
	public String getBld() {
		return bld;
	}
	public void setBld(String bld) {
		this.bld = bld;
	}
	public String getUrineElse() {
		return urineElse;
	}
	public void setUrineElse(String urineElse) {
		this.urineElse = urineElse;
	}
	public Double getMau() {
		return mau;
	}
	public void setMau(Double mau) {
		this.mau = mau;
	}
	public String getBloodStool() {
		return bloodStool;
	}
	public void setBloodStool(String bloodStool) {
		this.bloodStool = bloodStool;
	}
	public Double getSgpt() {
		return sgpt;
	}
	public void setSgpt(Double sgpt) {
		this.sgpt = sgpt;
	}
	public Double getSgot() {
		return sgot;
	}
	public void setSgot(Double sgot) {
		this.sgot = sgot;
	}
	public Double getAlb() {
		return alb;
	}
	public void setAlb(Double alb) {
		this.alb = alb;
	}
	public Double getTbil() {
		return tbil;
	}
	public void setTbil(Double tbil) {
		this.tbil = tbil;
	}
	public Double getDbil() {
		return dbil;
	}
	public void setDbil(Double dbil) {
		this.dbil = dbil;
	}
	public Double getScr() {
		return scr;
	}
	public void setScr(Double scr) {
		this.scr = scr;
	}
	public Double getBun() {
		return bun;
	}
	public void setBun(Double bun) {
		this.bun = bun;
	}
	public Double getPotassium() {
		return potassium;
	}
	public void setPotassium(Double potassium) {
		this.potassium = potassium;
	}
	public Double getSodium() {
		return sodium;
	}
	public void setSodium(Double sodium) {
		this.sodium = sodium;
	}
	public Double getChol() {
		return chol;
	}
	public void setChol(Double chol) {
		this.chol = chol;
	}
	public Double getTrig() {
		return trig;
	}
	public void setTrig(Double trig) {
		this.trig = trig;
	}
	public Double getLdlc() {
		return ldlc;
	}
	public void setLdlc(Double ldlc) {
		this.ldlc = ldlc;
	}
	public Double getHdlc() {
		return hdlc;
	}
	public void setHdlc(Double hdlc) {
		this.hdlc = hdlc;
	}
	
	public String getXray1() {
		return xray1;
	}
	public void setXray1(String xray1) {
		this.xray1 = xray1;
	}
	public String getXray2() {
		return xray2;
	}
	public void setXray2(String xray2) {
		this.xray2 = xray2;
	}
	public String getBultra1() {
		return bultra1;
	}
	public void setBultra1(String bultra1) {
		this.bultra1 = bultra1;
	}
	public String getBultra2() {
		return bultra2;
	}
	public void setBultra2(String bultra2) {
		this.bultra2 = bultra2;
	}
	public String getEcg1() {
		return ecg1;
	}
	public void setEcg1(String ecg1) {
		this.ecg1 = ecg1;
	}
	public String getEcg2() {
		return ecg2;
	}
	public void setEcg2(String ecg2) {
		this.ecg2 = ecg2;
	}
	public String getSmear1() {
		return smear1;
	}
	public void setSmear1(String smear1) {
		this.smear1 = smear1;
	}
	public String getSmear2() {
		return smear2;
	}
	public void setSmear2(String smear2) {
		this.smear2 = smear2;
	}
	public String getAuxiExamElse() {
		return auxiExamElse;
	}
	public void setAuxiExamElse(String auxiExamElse) {
		this.auxiExamElse = auxiExamElse;
	}
	public String getMildPhy() {
		return mildPhy;
	}
	public void setMildPhy(String mildPhy) {
		this.mildPhy = mildPhy;
	}
	public String getFaintPhy() {
		return faintPhy;
	}
	public void setFaintPhy(String faintPhy) {
		this.faintPhy = faintPhy;
	}
	public String getYangPhy() {
		return yangPhy;
	}
	public void setYangPhy(String yangPhy) {
		this.yangPhy = yangPhy;
	}
	public String getYinPhy() {
		return yinPhy;
	}
	public void setYinPhy(String yinPhy) {
		this.yinPhy = yinPhy;
	}
	public String getTanPhy() {
		return tanPhy;
	}
	public void setTanPhy(String tanPhy) {
		this.tanPhy = tanPhy;
	}
	public String getMuggyPhy() {
		return muggyPhy;
	}
	public void setMuggyPhy(String muggyPhy) {
		this.muggyPhy = muggyPhy;
	}
	public String getXueyuPhy() {
		return xueyuPhy;
	}
	public void setXueyuPhy(String xueyuPhy) {
		this.xueyuPhy = xueyuPhy;
	}
	public String getQiyuPhy() {
		return qiyuPhy;
	}
	public void setQiyuPhy(String qiyuPhy) {
		this.qiyuPhy = qiyuPhy;
	}
	public String getTebingPhy() {
		return tebingPhy;
	}
	public void setTebingPhy(String tebingPhy) {
		this.tebingPhy = tebingPhy;
	}
	public String getCerebroDis1() {
		return cerebroDis1;
	}
	public void setCerebroDis1(String cerebroDis1) {
		this.cerebroDis1 = cerebroDis1;
	}
	public String getCerebroDis2() {
		return cerebroDis2;
	}
	public void setCerebroDis2(String cerebroDis2) {
		this.cerebroDis2 = cerebroDis2;
	}
	public String getKidneyDis1() {
		return kidneyDis1;
	}
	public void setKidneyDis1(String kidneyDis1) {
		this.kidneyDis1 = kidneyDis1;
	}
	public String getKidneyDis2() {
		return kidneyDis2;
	}
	public void setKidneyDis2(String kidneyDis2) {
		this.kidneyDis2 = kidneyDis2;
	}
	public String getHeartDis1() {
		return heartDis1;
	}
	public void setHeartDis1(String heartDis1) {
		this.heartDis1 = heartDis1;
	}
	public String getHeartDis2() {
		return heartDis2;
	}
	public void setHeartDis2(String heartDis2) {
		this.heartDis2 = heartDis2;
	}
	public String getVesselDis1() {
		return vesselDis1;
	}
	public void setVesselDis1(String vesselDis1) {
		this.vesselDis1 = vesselDis1;
	}
	public String getVesselDis2() {
		return vesselDis2;
	}
	public void setVesselDis2(String vesselDis2) {
		this.vesselDis2 = vesselDis2;
	}
	public String getEyeDis1() {
		return eyeDis1;
	}
	public void setEyeDis1(String eyeDis1) {
		this.eyeDis1 = eyeDis1;
	}
	public String getEyeDis2() {
		return eyeDis2;
	}
	public void setEyeDis2(String eyeDis2) {
		this.eyeDis2 = eyeDis2;
	}
	public String getNervSysDis1() {
		return nervSysDis1;
	}
	public void setNervSysDis1(String nervSysDis1) {
		this.nervSysDis1 = nervSysDis1;
	}
	public String getNervSysDis2() {
		return nervSysDis2;
	}
	public void setNervSysDis2(String nervSysDis2) {
		this.nervSysDis2 = nervSysDis2;
	}
	public String getElseSysDis1() {
		return elseSysDis1;
	}
	public void setElseSysDis1(String elseSysDis1) {
		this.elseSysDis1 = elseSysDis1;
	}
	public String getElseSysDis2() {
		return elseSysDis2;
	}
	public void setElseSysDis2(String elseSysDis2) {
		this.elseSysDis2 = elseSysDis2;
	}
	public User getDoctor() {
		return doctor;
	}
	public void setDoctor(User doctor) {
		this.doctor = doctor;
	}
	public User getRecorder() {
		return recorder;
	}
	public void setRecorder(User recorder) {
		this.recorder = recorder;
	}
	public Date getExamDate() {
		return examDate;
	}
	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}
	public ResidentArchive getResidentArchive() {
		return residentArchive;
	}
	public void setResidentArchive(ResidentArchive residentArchive) {
		this.residentArchive = residentArchive;
	}
	public Set<HospitalHistory> getHospitalHistorys() {
		return hospitalHistorys;
	}
	public void setHospitalHistorys(Set<HospitalHistory> hospitalHistorys) {
		this.hospitalHistorys = hospitalHistorys;
	}
	public Set<Medication> getMedications() {
		return medications;
	}
	public void setMedications(Set<Medication> medications) {
		this.medications = medications;
	}
	
	
}
