document.getElementById("Dis_Title").addEventListener("blur", checkSubject);
document.getElementById("Dis_Descri").addEventListener("blur", checkDescri);

        function checkSubject() {
            let theSubjectObj = document.getElementById("Dis_Title");
            let theSubjectObjVal = theSubjectObj.value;
            let spn = document.getElementById("idspn");
            if (theSubjectObjVal == ("")) {
				console.log("456");
                spn.innerHTML = "不可空白";
            }else{
				spn.innerHTML = "";
			}
        }

        function checkDescri() {           
            let theDescriObj = document.getElementById("Dis_Descri");
            let theDescriObjVal = theDescriObj.value;
            let spnd = document.getElementById("idspd");

            if (theDescriObjVal == "") {
                spnd.innerHTML = "不可空白";
            }else{
				spnd.innerHTML = "";
			}
        }
        
