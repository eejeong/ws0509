


let jsp01 = {
    data:0,
    init:function (num){
        this.data=num;
        // this.data='<c:out value="${num}"/>';
        this.display();
    },
    display:function (){
        $('#jsp01').text(this.data+'');
    }
};