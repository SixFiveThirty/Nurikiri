async function rest_get(url){
	try{
		let res = await fetch(url);
		return await res.json();
	}catch(e){
		console.log(e);
	}
}

async function rest_create(url,data){
	try{
		let res = await fetch(url,{
		method : "POST",
		headers : {"Content-Type": "application/json"},
		body : JSON.stringify(data),
		})
		return await res.json();
	} catch(e){
		console.log(e);
	}
}


async function rest_modify(url,data){
	try{
		let res = await fetch(url,{
		method : "PUT",
		headers : {"Content-Type": "application/json"},
		body : JSON.stringify(data),
		})
		return await res.json();
	} catch(e){
		console.log(e);
	}
}


async function rest_delete(url){
	try{
		let res = await fetch(url,{method : "DELETE"});
		return await res.text();  //res.json(); 문자열로 인식못해서 text로 수정.
	} catch(e){
		console.log(e);
	}
}

