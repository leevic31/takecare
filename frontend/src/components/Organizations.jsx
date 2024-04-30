import { Link, Outlet } from "react-router-dom";
import axios from 'axios';
import * as Dialog from '@radix-ui/react-dialog';
import { Cross2Icon } from '@radix-ui/react-icons';
import { useEffect, useState } from "react";

export default function Organizations() {
    const [organizations, setOrganizations] = useState([]);
    const [name, setName] = useState();
    const [open, setOpen] = useState(false);

    const getOrganizations = () => {
        const url = "http://localhost:3000/organizations"
        axios.get(url).then(response => {
            setOrganizations(Object.entries(response.data));
        })
    }

    useEffect(() => {
        getOrganizations();
    }, []);

    const handleSubmit = async (e) => {
        // Prevent the default submit and page reload
        e.preventDefault();
    
        const url = "http://localhost:3000/organizations"

        await axios.post(url, {name: name}).then(response => {
            getOrganizations();
        })
        // resets form input
        setName('');
        setOpen(false);
    }

    return (
        <>
            <Dialog.Root open={open} onOpenChange={setOpen}>
                <Dialog.Trigger asChild>
                <button className="mt-[20px] text-violet11 shadow-blackA4 hover:bg-mauve3 inline-flex h-[35px] items-center justify-center rounded-[4px] bg-white px-[15px] font-medium leading-none shadow-[0_2px_10px] focus:shadow-[0_0_0_2px] focus:shadow-black focus:outline-none">
                    Add organization
                </button>
                </Dialog.Trigger>
                <Dialog.Portal>
                    <Dialog.Overlay className="bg-blackA6 data-[state=open]:animate-overlayShow fixed inset-0" />
                    <Dialog.Content className="data-[state=open]:animate-contentShow fixed top-[50%] left-[50%] max-h-[85vh] w-[25vw] max-w-[450px] translate-x-[-50%] translate-y-[-50%] rounded-[6px] bg-white p-[25px] shadow-[hsl(206_22%_7%_/_35%)_0px_10px_38px_-10px,_hsl(206_22%_7%_/_20%)_0px_10px_20px_-15px] focus:outline-none">
                        <Dialog.Title className="text-mauve12 m-0 text-[17px] font-medium">
                            Add organization
                        </Dialog.Title>
                        <Dialog.Close asChild>
                            <button
                                className="text-violet11 hover:bg-violet4 focus:shadow-violet7 absolute top-[10px] right-[10px] inline-flex h-[25px] w-[25px] appearance-none items-center justify-center rounded-full focus:shadow-[0_0_0_2px] focus:outline-none"
                                aria-label="Close"
                            >
                                <Cross2Icon />
                            </button>
                        </Dialog.Close>

                        <fieldset className="mb-[10px] flex items-center gap-5">
                            <form onSubmit={handleSubmit}>
                                <label className="text-violet11 w-[90px] text-right text-[15px]" htmlFor="name">Name</label>
                                <input 
                                    type="text"
                                    name="name"
                                    value={name}
                                    onChange={(e) => setName(e.target.value)}
                                    className="text-violet11 shadow-violet7 focus:shadow-violet8 inline-flex h-[35px] w-full flex-1 items-center justify-center rounded-[4px] px-[10px] text-[15px] leading-none shadow-[0_0_0_1px] outline-none focus:shadow-[0_0_0_2px]"
                                    id="name"
                                />
                                <div className="mt-[25px] flex justify-end">
                                    <button className="bg-green4 text-green11 hover:bg-green5 focus:shadow-green7 inline-flex h-[35px] items-center justify-center rounded-[4px] px-[15px] font-medium leading-none focus:shadow-[0_0_0_2px] focus:outline-none">Add</button>
                                </div>
                            </form>
                        </fieldset>
                    </Dialog.Content>
                </Dialog.Portal>
            </Dialog.Root>

            {organizations.map(organization => (
                <div className="py-5">
                    <div className="mx-auto max-w-sm rounded-lg bg-gray-200 p-4">
                        <Link to={`/organizations/${organization[1]['id']}`} key={organization[1]['id']}>
                            <div className="flex justify-between rounded-lg bg-white px-4 py-4 text-gray-900 shadow">                          
                                <p>{organization[1].name}</p>
                            </div>
                        </Link>
                    </div>
                </div>
            ))}
            
            <Outlet />
        </>
    )
}
