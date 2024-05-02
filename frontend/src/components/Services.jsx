import axios from 'axios';
import * as Dialog from '@radix-ui/react-dialog';
import { Cross2Icon, PlusCircledIcon  } from '@radix-ui/react-icons';
import { useState, useEffect } from "react";
import { Table, Flex, Text, Grid, Card, Inset, Box } from '@radix-ui/themes';

export default function Services( { id }) {
    const [services, setServices] = useState([]);
    const [serviceType, setServiceType] = useState();
    const [open, setOpen] = useState(false);

    const getServices = () => {
        const url = `http://localhost:3000/organizations/${id}/services`
    
        axios.get(url).then(response => {
            setServices(Object.entries(response.data));
        })
    }

    useEffect(() => {
        getServices();
    }, []);

    const handleSubmit = async (e) => {
        // Prevent the default submit and page reload
        e.preventDefault();
    
        const url = `http://localhost:3000/organizations/${id}/services`

        await axios.post(url, {service_type: serviceType}).then(response => {
            getServices();
        })
        // resets form input
        setServiceType('');
        setOpen(false);
    }

    return (
        <>
            <Box pr="7" pl="7" pt="9">
                <Card size="5">
                    <Grid columns="2" width="500px" gapX="9">
                        <Box>
                            <Table.Root variant='surface' size='2'>
                                <Table.Header>
                                    <Table.Row>
                                    <Table.ColumnHeaderCell>
                                        Services
                                        <Dialog.Root open={open} onOpenChange={setOpen}>
                                            <Dialog.Trigger asChild>
                                            <button className='absolute right-3'>
                                                <PlusCircledIcon />
                                            </button>
                                            </Dialog.Trigger>
                                            <Dialog.Portal>
                                                <Dialog.Overlay className="bg-blackA6 data-[state=open]:animate-overlayShow fixed inset-0" />
                                                <Dialog.Content className="data-[state=open]:animate-contentShow fixed top-[50%] left-[50%] max-h-[85vh] w-[25vw] max-w-[450px] translate-x-[-50%] translate-y-[-50%] rounded-[6px] bg-white p-[25px] shadow-[hsl(206_22%_7%_/_35%)_0px_10px_38px_-10px,_hsl(206_22%_7%_/_20%)_0px_10px_20px_-15px] focus:outline-none">
                                                    <Dialog.Title className="text-mauve12 m-0 text-[17px] font-medium">
                                                        Add service
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
                                                            <label className="text-violet11 w-[90px] text-right text-[15px]" htmlFor="serviceType">Service Type</label>
                                                            <input 
                                                                type="text"
                                                                name="serviceType"
                                                                value={serviceType}
                                                                onChange={(e) => setServiceType(e.target.value)}
                                                                className="text-violet11 shadow-violet7 focus:shadow-violet8 inline-flex h-[35px] w-full flex-1 items-center justify-center rounded-[4px] px-[10px] text-[15px] leading-none shadow-[0_0_0_1px] outline-none focus:shadow-[0_0_0_2px]"
                                                                id="serviceType"
                                                            />
                                                            <div className="mt-[25px] flex justify-end">
                                                                <button className="bg-green4 text-green11 hover:bg-green5 focus:shadow-green7 inline-flex h-[35px] items-center justify-center rounded-[4px] px-[15px] font-medium leading-none focus:shadow-[0_0_0_2px] focus:outline-none">Add</button>
                                                            </div>
                                                        </form>
                                                    </fieldset>
                                                </Dialog.Content>
                                            </Dialog.Portal>
                                        </Dialog.Root>
                                    </Table.ColumnHeaderCell>
                                    </Table.Row>
                                </Table.Header>
                                <Table.Body>
                                    {services.map(service => (
                                        <Table.Row>
                                            <Table.Cell>{service[1].service_type}</Table.Cell>
                                        </Table.Row>
                                    ))}
                                </Table.Body>
                            </Table.Root>
                        </Box>
                        <Box>
                            <Flex direction="column">
                                {services.map(service => (
                                    <Text size="5">{service[1].service_type}</Text>
                                ))}
                            </Flex>
                        </Box>
                    </Grid>
                </Card>
            </Box>
        </>    
    )
}
