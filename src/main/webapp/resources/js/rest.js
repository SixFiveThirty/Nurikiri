async function rest_get(url) {
  try {
    let res = await fetch(url);
    return await res.json();
  } catch (e) {
    console.log(e);
  }
}

async function rest_message_get(url, param) {
  try {
    let res = await fetch(
      url +
        new URLSearchParams({
          phone: param,
        })
    );
    return await res.json();
  } catch (e) {
    console.log(e);
  }
}

async function rest_auth_num_post(url, data) {
	try {
		let res = await fetch(url, {
			method: "POST",
			headers: {"Content-Type": "application/json"},
			body: JSON.stringify(data), //json 문자열로 인코딩
		});
		return await res.text();
	} catch(e) {
		console.log(e);
	}
}

async function rest_create(url, data) {
  try {
  
    let res = await fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data), //json문자열로 인코딩
    });
    return await res.json();
  } catch (e) {
    console.log(e);
  }
}


async function rest_modify(url, data) {
  try {
    let res = await fetch(url, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data),
    });

    return await res.json(); //JSON.parse()로 변환
  } catch (e) {
    console.log(e);
  }
}

async function rest_delete(url) {
  try {
    let res = await fetch(url, { method: 'DELETE' });
    return await res.text(); //res.text(); -> 문자열로 처리함.	//res.json(); -> json으로 처리함.
  } catch (e) {
    console.log(e);
  }
}
