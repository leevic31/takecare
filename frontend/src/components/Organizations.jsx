import { Link, Outlet } from "react-router-dom";
import axios from 'axios';
import { Table, Flex, Text, Grid, Card, Box, Dialog, Button, TextField } from '@radix-ui/themes';
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
                <Button>Add organization</Button>
                </Dialog.Trigger>
                    <Dialog.Content>
                        <Dialog.Title>
                            Add organization
                        </Dialog.Title>
                            <form onSubmit={handleSubmit}>
                                <label htmlFor="name">
                                    <Text>Name</Text>
                                    <TextField.Root 
                                        type="text"
                                        name="name"
                                        value={name}
                                        onChange={(e) => setName(e.target.value)}
                                        id="name"
                                    />
                                </label>
                                <Flex gap="3" mt="4" justify="end">
                                    <Dialog.Close asChild>
                                        <Button>Cancel</Button>
                                    </Dialog.Close>
                                    <Button>Add</Button>
                                </Flex>
                            </form>
                    </Dialog.Content>
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
