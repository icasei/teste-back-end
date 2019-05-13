
// Wildyson Dantas dos Santos
//wildyson.santos@gmailcom

//funcao responsavel por gerar a GUID do usuario de acordo com a RFC 4122,.
//link da rfc: https://www.ietf.org/rfc/rfc4122.txt
function createUUID(){
    var dt = new Date().getTime();
    var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = (dt + Math.random()*16)%16 | 0;
        dt = Math.floor(dt/16);
        return (c=='x' ? r :(r&0x3|0x8)).toString(16);
    });
    return uuid;
}

//funcao responsavel por verificar se existe cookiei
function getCookie(){
    var ck = document.cookie.split(';');
    if(ck.length < 3){
        return true;
    }else{
        false;
    }
   
}

//funcao responsavel por criar o cookie guid
function createCookie(guid){
    document.cookie = "guid="+guid+";";
}

//funcao responsavel por criar cookie url
function setUrl(link){
    document.cookie = "URL="+link+";";
}

//funcao responsavel por criar cookie data
function setData(){
    var now = new Date();
    var presente = now.getDate() + "/" + now.getMonth() + "/" + now.getFullYear();
    var hora =  now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
    document.cookie = "data="+presente + " " + hora+";";
}

//funcao responsavel por enviar os dados para o banco de dados Sqlite
function savelog(link){
    if(getCookie()){ //verificação para ver se o cookie existe.
        var guid = createUUID();
        createCookie(guid);
    }
    
    setUrl(link);
    setData();  
}


//função responavel por enviar dados apartir da barra de url
$(function(){
   savelog(document.URL);

});

//função responsavel por capturar ação do click ao link
$(document).on('click', function(e) {
    if(e.target.tagName.toLowerCase() === 'a'){
        savelog(e.target.href); //salvando o endereço do link
    }
    
});



