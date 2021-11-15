// copy from ganache derived keys
var keys = [
  "39327f5bd6b2fdf6def72fd75c09856d0af74f22d0a7286633e4689e8f3a8f14",
  "e3977de571d6814d72ea40a318dfde5e67704350ee4555dda12ddf79e6239601",
  "161c7868208e64352aaedc3ac965e6752f76218dbad13b312e474fb2a0a97846",
  "7ca46544e9ef27a6f806a70ef2f97051c3b29cf3bcfd71495ed8627d5863f258",
  "dfb27d7d91f2d5b4caa257745d71355d6b30f527d44b654837211d49efe0b938",
  "f40d2ce55822ab90aa6c76a7b70ae212a4c5e23ad6ea2ab690dc0373599bf59d",
  "6d4b0704a7a4446daf540c9e27ecb94a7158b138cd25c8cb2dc7a5e1511e21af",
  "47e492be2bc4c211f7edb0b23fe92138c07ccde610def6fc5c116adbd4b9fe5d",
  "7429e0aa6afc39e0efe7f90a4d50c8703cce71946779c4d5a4ef21c3701d39e7",
  "f828697b8eb05a651d94e6908f2810047e39d6bd4728c1f22ae5ba62906e6cff",
  "7b1e4f0289be825188f1092e2f25122730f904fc1c388faa8d693cd00c56cff9",
  "b9ab6261e50d0a7a387776c5495ef269de418c945082d74c0e22f136b5f32a7d",
  "b4e07590ec3b767e6d0e84bef57e0c49f5d1d44a83fd869634a22a0b1f77ceac",
  "147dfb7f5061d2e552548e16f0b87540f75aba12da9c70e607cad5955809d197",
  "1a47764175a378f777217fe1517a786a7f15a324cf3175dcdf0d92e23ee0dbdb",
  "58b5c8dd9edd0a78a57fa767d08bcba770a4fc9174118971a2e571288a0561b3",
  "e12937e1e55b49e3f47c46b10ba0d4c4bf002599d66db4cec83101b1357f505f",
  "dcb432bac809a4bd0fedd46d9a898fd120719d867576dbf50893e48d2400e774",
  "1205a5c3e478e292fb9629bc7668f4e54ef5be8a1be6632aaef54412a360b791",
  "689d474fdc110d3e740b2e4c19a07c3b97de3721c775cb8f53f3531eb4c3ba85"
];

var passphrase = 'gV6WHG599vNJhtR6pt9cW9F6wUs7FAzy';

if (personal.listAccounts.length < 20) {
  for(var i = 0; i < keys.length; i++) { 
    var pubkey = personal.importRawKey(keys[i], passphrase);
    eth.sendTransaction({
      from: eth.coinbase,
      to: pubkey,
      value: web3.toWei(1000, "ether")
    });
    console.log('imported ', pubkey);
  }
  console.log('Successfully imported ', keys.length, ' keys into the keystore');
}
for(var i = 1; i < eth.accounts.length; ++i) {
  personal.unlockAccount(eth.accounts[i], passphrase);
  console.log("#" + i, eth.accounts[i], web3.fromWei(eth.getBalance(eth.accounts[i]), 'ether'), 'fETH');
}