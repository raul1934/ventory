class NotaFiscalResult {
  bool success = false;
  String? message;
  int? id;
  String? createdAt;
  Invoice? invoice;

  NotaFiscalResult(
      {required this.success,
      this.message,
      this.id,
      this.createdAt,
      this.invoice});

  NotaFiscalResult.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    id = json['id'];
    createdAt = json['created_at'];
    invoice =
        json['invoice'] != null ? Invoice.fromJson(json['invoice']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['id'] = id;
    data['created_at'] = createdAt;
    if (invoice != null) {
      data['invoice'] = invoice!.toJson();
    }
    return data;
  }
}

class Invoice {
  Ide? ide;
  Ret? ret;
  Dest? dest;
  Emit? emit;
  Info? info;
  List<Items>? items;
  Transp? transp;

  Invoice(
      {this.ide,
      this.ret,
      this.dest,
      this.emit,
      this.info,
      this.items,
      this.transp});

  Invoice.fromJson(Map<String, dynamic> json) {
    ide = json['ide'] != null ? Ide.fromJson(json['ide']) : null;
    ret = json['ret'] != null ? Ret.fromJson(json['ret']) : null;
    dest = json['dest'] != null ? Dest.fromJson(json['dest']) : null;
    emit = json['emit'] != null ? Emit.fromJson(json['emit']) : null;
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    transp = json['transp'] != null ? Transp.fromJson(json['transp']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ide != null) {
      data['ide'] = ide!.toJson();
    }
    if (ret != null) {
      data['ret'] = ret!.toJson();
    }
    if (dest != null) {
      data['dest'] = dest!.toJson();
    }
    if (emit != null) {
      data['emit'] = emit!.toJson();
    }
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (transp != null) {
      data['transp'] = transp!.toJson();
    }
    return data;
  }
}

class Ide {
  String? cDV;
  String? cNF;
  String? cUF;
  String? mod;
  String? nNF;
  String? tpNF;
  NFref? nFref;
  String? dhEmi;
  String? natOp;
  String? serie;
  String? tpAmb;
  String? tpImp;
  String? cMunFG;
  String? finNFe;
  String? idDest;
  String? tpEmis;
  String? indPres;
  String? procEmi;
  String? verProc;
  String? indFinal;

  Ide(
      {this.cDV,
      this.cNF,
      this.cUF,
      this.mod,
      this.nNF,
      this.tpNF,
      this.nFref,
      this.dhEmi,
      this.natOp,
      this.serie,
      this.tpAmb,
      this.tpImp,
      this.cMunFG,
      this.finNFe,
      this.idDest,
      this.tpEmis,
      this.indPres,
      this.procEmi,
      this.verProc,
      this.indFinal});

  Ide.fromJson(Map<String, dynamic> json) {
    cDV = json['cDV'];
    cNF = json['cNF'];
    cUF = json['cUF'];
    mod = json['mod'];
    nNF = json['nNF'];
    tpNF = json['tpNF'];
    nFref = json['NFref'] != null ? NFref.fromJson(json['NFref']) : null;
    dhEmi = json['dhEmi'];
    natOp = json['natOp'];
    serie = json['serie'];
    tpAmb = json['tpAmb'];
    tpImp = json['tpImp'];
    cMunFG = json['cMunFG'];
    finNFe = json['finNFe'];
    idDest = json['idDest'];
    tpEmis = json['tpEmis'];
    indPres = json['indPres'];
    procEmi = json['procEmi'];
    verProc = json['verProc'];
    indFinal = json['indFinal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cDV'] = cDV;
    data['cNF'] = cNF;
    data['cUF'] = cUF;
    data['mod'] = mod;
    data['nNF'] = nNF;
    data['tpNF'] = tpNF;
    if (nFref != null) {
      data['NFref'] = nFref!.toJson();
    }
    data['dhEmi'] = dhEmi;
    data['natOp'] = natOp;
    data['serie'] = serie;
    data['tpAmb'] = tpAmb;
    data['tpImp'] = tpImp;
    data['cMunFG'] = cMunFG;
    data['finNFe'] = finNFe;
    data['idDest'] = idDest;
    data['tpEmis'] = tpEmis;
    data['indPres'] = indPres;
    data['procEmi'] = procEmi;
    data['verProc'] = verProc;
    data['indFinal'] = indFinal;
    return data;
  }
}

class NFref {
  String? refNFe;

  NFref({this.refNFe});

  NFref.fromJson(Map<String, dynamic> json) {
    refNFe = json['refNFe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refNFe'] = refNFe;
    return data;
  }
}

class Ret {
  String? iE;
  String? uF;
  String? cEP;
  String? nro;
  String? cNPJ;
  String? cMun;
  String? fone;
  String? xCpl;
  String? xLgr;
  String? xMun;
  String? cPais;
  String? email;
  String? xPais;
  String? xBairro;

  Ret(
      {this.iE,
      this.uF,
      this.cEP,
      this.nro,
      this.cNPJ,
      this.cMun,
      this.fone,
      this.xCpl,
      this.xLgr,
      this.xMun,
      this.cPais,
      this.email,
      this.xPais,
      this.xBairro});

  Ret.fromJson(Map<String, dynamic> json) {
    iE = json['IE'];
    uF = json['UF'];
    cEP = json['CEP'];
    nro = json['nro'];
    cNPJ = json['CNPJ'];
    cMun = json['cMun'];
    fone = json['fone'];
    xCpl = json['xCpl'];
    xLgr = json['xLgr'];
    xMun = json['xMun'];
    cPais = json['cPais'];
    email = json['email'];
    xPais = json['xPais'];
    xBairro = json['xBairro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IE'] = iE;
    data['UF'] = uF;
    data['CEP'] = cEP;
    data['nro'] = nro;
    data['CNPJ'] = cNPJ;
    data['cMun'] = cMun;
    data['fone'] = fone;
    data['xCpl'] = xCpl;
    data['xLgr'] = xLgr;
    data['xMun'] = xMun;
    data['cPais'] = cPais;
    data['email'] = email;
    data['xPais'] = xPais;
    data['xBairro'] = xBairro;
    return data;
  }
}

class Dest {
  String? iE;
  String? cNPJ;
  String? xNome;
  EnderDest? enderDest;
  String? indIEDest;

  Dest({this.iE, this.cNPJ, this.xNome, this.enderDest, this.indIEDest});

  Dest.fromJson(Map<String, dynamic> json) {
    iE = json['IE'];
    cNPJ = json['CNPJ'];
    xNome = json['xNome'];
    enderDest = json['enderDest'] != null
        ? EnderDest.fromJson(json['enderDest'])
        : null;
    indIEDest = json['indIEDest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IE'] = iE;
    data['CNPJ'] = cNPJ;
    data['xNome'] = xNome;
    if (enderDest != null) {
      data['enderDest'] = enderDest!.toJson();
    }
    data['indIEDest'] = indIEDest;
    return data;
  }
}

class EnderDest {
  String? uF;
  String? cEP;
  String? nro;
  String? cMun;
  String? fone;
  String? xCpl;
  String? xLgr;
  String? xMun;
  String? cPais;
  String? xPais;
  String? xBairro;

  EnderDest(
      {this.uF,
      this.cEP,
      this.nro,
      this.cMun,
      this.fone,
      this.xCpl,
      this.xLgr,
      this.xMun,
      this.cPais,
      this.xPais,
      this.xBairro});

  EnderDest.fromJson(Map<String, dynamic> json) {
    uF = json['UF'];
    cEP = json['CEP'];
    nro = json['nro'];
    cMun = json['cMun'];
    fone = json['fone'];
    xCpl = json['xCpl'];
    xLgr = json['xLgr'];
    xMun = json['xMun'];
    cPais = json['cPais'];
    xPais = json['xPais'];
    xBairro = json['xBairro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UF'] = uF;
    data['CEP'] = cEP;
    data['nro'] = nro;
    data['cMun'] = cMun;
    data['fone'] = fone;
    data['xCpl'] = xCpl;
    data['xLgr'] = xLgr;
    data['xMun'] = xMun;
    data['cPais'] = cPais;
    data['xPais'] = xPais;
    data['xBairro'] = xBairro;
    return data;
  }
}

class Emit {
  String? iE;
  String? cRT;
  String? cNPJ;
  String? xFant;
  String? xNome;
  EnderEmit? enderEmit;

  Emit({this.iE, this.cRT, this.cNPJ, this.xFant, this.xNome, this.enderEmit});

  Emit.fromJson(Map<String, dynamic> json) {
    iE = json['IE'];
    cRT = json['CRT'];
    cNPJ = json['CNPJ'];
    xFant = json['xFant'];
    xNome = json['xNome'];
    enderEmit = json['enderEmit'] != null
        ? EnderEmit.fromJson(json['enderEmit'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IE'] = iE;
    data['CRT'] = cRT;
    data['CNPJ'] = cNPJ;
    data['xFant'] = xFant;
    data['xNome'] = xNome;
    if (enderEmit != null) {
      data['enderEmit'] = enderEmit!.toJson();
    }
    return data;
  }
}

class EnderEmit {
  String? uF;
  String? cEP;
  String? nro;
  String? cMun;
  String? fone;
  String? xLgr;
  String? xMun;
  String? cPais;
  String? xPais;
  String? xBairro;

  EnderEmit(
      {this.uF,
      this.cEP,
      this.nro,
      this.cMun,
      this.fone,
      this.xLgr,
      this.xMun,
      this.cPais,
      this.xPais,
      this.xBairro});

  EnderEmit.fromJson(Map<String, dynamic> json) {
    uF = json['UF'];
    cEP = json['CEP'];
    nro = json['nro'];
    cMun = json['cMun'];
    fone = json['fone'];
    xLgr = json['xLgr'];
    xMun = json['xMun'];
    cPais = json['cPais'];
    xPais = json['xPais'];
    xBairro = json['xBairro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UF'] = uF;
    data['CEP'] = cEP;
    data['nro'] = nro;
    data['cMun'] = cMun;
    data['fone'] = fone;
    data['xLgr'] = xLgr;
    data['xMun'] = xMun;
    data['cPais'] = cPais;
    data['xPais'] = xPais;
    data['xBairro'] = xBairro;
    return data;
  }
}

class Info {
  String? infCpl;

  Info({this.infCpl});

  Info.fromJson(Map<String, dynamic> json) {
    infCpl = json['infCpl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['infCpl'] = infCpl;
    return data;
  }
}

class Items {
  String? nCM;
  String? cEST;
  String? cFOP;
  String? cEAN;
  String? qCom;
  String? uCom;
  String? cProd;
  String? qTrib;
  String? uTrib;
  String? vProd;
  String? xProd;
  String? indTot;
  String? vUnCom;
  String? vUnTrib;
  String? cEANTrib;

  Items(
      {this.nCM,
      this.cEST,
      this.cFOP,
      this.cEAN,
      this.qCom,
      this.uCom,
      this.cProd,
      this.qTrib,
      this.uTrib,
      this.vProd,
      this.xProd,
      this.indTot,
      this.vUnCom,
      this.vUnTrib,
      this.cEANTrib});

  Items.fromJson(Map<String, dynamic> json) {
    nCM = json['NCM'];
    cEST = json['CEST'];
    cFOP = json['CFOP'];
    cEAN = json['cEAN'];
    qCom = json['qCom'];
    uCom = json['uCom'];
    cProd = json['cProd'];
    qTrib = json['qTrib'];
    uTrib = json['uTrib'];
    vProd = json['vProd'];
    xProd = json['xProd'];
    indTot = json['indTot'];
    vUnCom = json['vUnCom'];
    vUnTrib = json['vUnTrib'];
    cEANTrib = json['cEANTrib'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['NCM'] = nCM;
    data['CEST'] = cEST;
    data['CFOP'] = cFOP;
    data['cEAN'] = cEAN;
    data['qCom'] = qCom;
    data['uCom'] = uCom;
    data['cProd'] = cProd;
    data['qTrib'] = qTrib;
    data['uTrib'] = uTrib;
    data['vProd'] = vProd;
    data['xProd'] = xProd;
    data['indTot'] = indTot;
    data['vUnCom'] = vUnCom;
    data['vUnTrib'] = vUnTrib;
    data['cEANTrib'] = cEANTrib;
    return data;
  }
}

class Transp {
  Vol? vol;
  String? modFrete;
  Transporta? transporta;

  Transp({this.vol, this.modFrete, this.transporta});

  Transp.fromJson(Map<String, dynamic> json) {
    vol = json['vol'] != null ? Vol.fromJson(json['vol']) : null;
    modFrete = json['modFrete'];
    transporta = json['transporta'] != null
        ? Transporta.fromJson(json['transporta'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vol != null) {
      data['vol'] = vol!.toJson();
    }
    data['modFrete'] = modFrete;
    if (transporta != null) {
      data['transporta'] = transporta!.toJson();
    }
    return data;
  }
}

class Vol {
  String? esp;
  String? qVol;
  String? pesoB;
  String? pesoL;

  Vol({this.esp, this.qVol, this.pesoB, this.pesoL});

  Vol.fromJson(Map<String, dynamic> json) {
    esp = json['esp'];
    qVol = json['qVol'];
    pesoB = json['pesoB'];
    pesoL = json['pesoL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['esp'] = esp;
    data['qVol'] = qVol;
    data['pesoB'] = pesoB;
    data['pesoL'] = pesoL;
    return data;
  }
}

class Transporta {
  String? iE;
  String? uF;
  String? cNPJ;
  String? xMun;
  String? xNome;
  String? xEnder;

  Transporta({this.iE, this.uF, this.cNPJ, this.xMun, this.xNome, this.xEnder});

  Transporta.fromJson(Map<String, dynamic> json) {
    iE = json['IE'];
    uF = json['UF'];
    cNPJ = json['CNPJ'];
    xMun = json['xMun'];
    xNome = json['xNome'];
    xEnder = json['xEnder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IE'] = iE;
    data['UF'] = uF;
    data['CNPJ'] = cNPJ;
    data['xMun'] = xMun;
    data['xNome'] = xNome;
    data['xEnder'] = xEnder;
    return data;
  }
}
