x-spot
======
- JSON for Home:

http://www.panin-am.co.id:800/jsonviewnews.aspx
http://www.panin-am.co.id:800/json.aspx

- JSON after login (present customer information)

http://www.panin-am.co.id:800/jsonLoginUser.aspx
post value: userName and password

- customer inquiry (cek saldo)

NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.panin-am.co.id:800/jsonCheckBalance.aspx"]];
    
    
    [request setPostValue:sessionID forKey:@"sessionid"];
    [request setPostValue:tanggalSend forKey:@"date"]; >> default current date format YYYY-MM-DD
    
- check transaction 

NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.panin-am.co.id:800/jsonCheckTransactionHistory.aspx"]];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    
    [request setPostValue:sessionID forKey:@"sessionid"];
    [request setPostValue:ftype forKey:@"fType"];
    [request setPostValue:fvalue forKey:@"fVal"];
Remarks :
Jumlah transaksi ftype =1
periode transaksi ftype = 2
6 bulan Terakhir"]) fvalue = @"1";
1 Tahun Terakhir"]) fvalue = @"2";
3 Tahun Terakhir"]) fvalue = @"3";
Periode Tertentu"]) fvalue = @"4";

- fund fact sheet:

NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.panin-am.co.id:800/jsonFFS.aspx"]];
    
    
    [request setPostValue:sessionID forKey:@"sessionid"];



- unduh form:
  >> still havent got the detail yet
  
- simulasi berkala : >> place in home menu
  
   NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.panin-am.co.id:800/jsonSimulasiInvestasiBerkala.aspx"]];
    
    
    [request setPostValue:sessionID forKey:@"sessionid"];
    [request setPostValue:fvalue forKey:@"fundCode"];
    [request setPostValue:tanggalInvestasi forKey:@"dateOfMonth"];
    [request setPostValue:strTanggalFrom forKey:@"startDate"];
    [request setPostValue:strTanggalTo forKey:@"endDate"];

    
    
