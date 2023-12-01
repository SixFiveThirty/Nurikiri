//Number : 자바스크립트의 숫자객체
//.prototype :
//.formatBytes : 모든 function에는 formatBytes에서 정의한 내용이 추가됨.
//함수를 정의한 코드임.
Number.prototype.formatBytes = function (decimals) {
   const bytes = this;//숫자
   if(bytes == 0) return '0 Bytes';
   var k = 1024, //KB = 1024Bytes
       dm = decimals || 3, //소숫점 3째자리까지 출력
       sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],//데이터 단위
       i = Math.floor(Math.log(bytes) / Math.log(k)); // 로그 계산해서 몇번째인지..
   return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i]; //size[i] 는 단위가 나옴.
}