import React, {useState, useEffect} from 'react';

//Use same URL but port 3001
let backendURL = window.location.href
backendURL = backendURL.replace(/:\d*\/$/,"")
backendURL = backendURL.replace(/\/$/,"")
backendURL = backendURL + ":3001"

function List() {

    const [services, setServices] = useState([])

    useEffect(()=>{
        fetch(backendURL + "/")
        .then((response) => response.json())
        .then((data) => setServices(data))
        .catch(error => {
            
        });
    },[])

    function approveClicked(serviceId) {
        fetch(backendURL + "/approve/"+serviceId, {
            method: "POST",
          })
            .then((response) => response.json()) // Parse the response as JSON
            .then((data) => setServices(data)) // Do something with the data
            .catch((error) => console.error(error)); // Handle errors
    }

    return (
        <ul role="list" className="divide-y divide-gray-100">
            {services.map((service) => (
                <li key={service.id} className="flex justify-between gap-x-6 py-5">
                <div className="flex gap-x-4">
                    <img className="h-12 w-12 flex-none rounded-full bg-gray-50" src={service.imageUrl} alt="" />
                    <div className="min-w-0 flex-auto">
                    <p className="text-sm font-semibold leading-6 text-gray-900">{service.name}</p>
                    <p className="mt-1 truncate text-xs leading-5 text-gray-500">{service.email}</p>
                    </div>
                </div>
                <div className="hidden sm:flex sm:flex-col sm:items-end">
                    <p className="text-sm leading-6 text-gray-900">{service.role}</p>
                    {service.approved ? (
                    <div className="mt-1 flex items-center gap-x-1.5">
                        <div className="flex-none rounded-full bg-emerald-500/20 p-1">
                        <div className="h-1.5 w-1.5 rounded-full bg-emerald-500" />
                        </div>
                        <p className="text-xs leading-5 text-gray-500">Approved</p>
                    </div>
                    ) : (
                    <div className="mt-1 flex items-center gap-x-1.5">
                        <button onClick={() => approveClicked(service.id)} className="bg-emerald-500 hover:bg-emerald-700 text-white font-bold py-1 px-4 mr-5 rounded">
                          Approve
                        </button>
                        <div className="flex-none rounded-full bg-amber-500/20 p-1">
                        <div className="h-1.5 w-1.5 rounded-full bg-amber-500" />
                        </div>
                        <p className="text-xs leading-5 text-gray-500">Not Approved</p>
                    </div>
                    )}
                </div>
                </li>
            ))}
        </ul>
    );
}

export default List;