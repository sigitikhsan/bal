void main () {
  // variabel 
  var nama = 'Sigit';
  var tinggi =169.0;
  var alamat = 'Depok';
  var sudahLogin = true;
  var umur = 17;
  print('nama saya $nama saya sedang belajar dart, umur saya $umur, tinggi saya $tinggi, dan rumah saya $alamat');

  // operator aritmatika
  var tanggalpeminjaman = 18;
  var tanggalpengembalian = 27;

  var lamapeminjaman = tanggalpengembalian - tanggalpeminjaman ;
  print('Lama peminjaman : $lamapeminjaman hari');
  

  // perulangan data {list}
  List <String> perangkat = [
    'Laptop',
    'HT',
    'Radio',
  ];
  for (String item in perangkat){
    print(item);
  }
  List <String> perangkat1 = [
    'Handphone',
    'Monitor',
    'Proyektor',
  ];
  perangkat1.add('Bangku');
  print(perangkat1);
  
  
}