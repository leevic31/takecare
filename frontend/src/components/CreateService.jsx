import React from 'react';
import { Form, redirect, useActionData } from "react-router-dom"
import axios from 'axios'
import { Button, ChevronDownIcon, Grid, Box } from '@radix-ui/themes';
import * as Select from '@radix-ui/react-select';
import classnames from 'classnames';
import * as Label from '@radix-ui/react-label';

export default function CreateService( { id } ) {
    const data = useActionData()
 
    return (
        <>
            <div className='text-violet11'>Create Service</div>

            <Form method="post" action="/organizations/:id/services/create">
                <input type="hidden" name="id" value={id}></input>
                <Grid columns="1" rows="4" gapY="3">
                    <Box>
                        <Select.Root name="service_type">
                            <Select.Trigger
                                className="inline-flex items-center justify-center rounded px-[15px] text-[13px] leading-none h-[35px] gap-[5px] bg-white text-violet11 shadow-[0_2px_10px] shadow-black/10 hover:bg-mauve3 focus:shadow-[0_0_0_2px] focus:shadow-black data-[placeholder]:text-violet9 outline-none"
                            >
                                <Select.Value placeholder="Select a service" />
                                <Select.Icon className="text-violet11">
                                    <ChevronDownIcon />
                                </Select.Icon>
                            </Select.Trigger>
                            <Select.Portal>
                                <Select.Content className="overflow-hidden bg-white rounded-md shadow-[0px_10px_38px_-10px_rgba(22,_23,_24,_0.35),0px_10px_20px_-15px_rgba(22,_23,_24,_0.2)]">
                                    <Select.Viewport className='p-[5px]'>
                                        <Select.Group>
                                            <Select.Label className="px-[25px] text-xs leading-[25px] text-mauve11">
                                                Services
                                            </Select.Label>
                                            <SelectItem value="physiotherapy">Physiotherapy</SelectItem>
                                            <SelectItem value="acupuncture">Acupuncture</SelectItem>
                                            <SelectItem value="massage_therapy">Massage Therapy</SelectItem>
                                        </Select.Group>
                                    </Select.Viewport>
                                </Select.Content>
                            </Select.Portal>
                        </Select.Root>
                    </Box>
                    <Box>
                        <Select.Root name="duration">
                            <Select.Trigger
                                className="inline-flex items-center justify-center rounded px-[15px] text-[13px] leading-none h-[35px] gap-[5px] bg-white text-violet11 shadow-[0_2px_10px] shadow-black/10 hover:bg-mauve3 focus:shadow-[0_0_0_2px] focus:shadow-black data-[placeholder]:text-violet9 outline-none"
                            >
                                <Select.Value placeholder="Select duration" />
                                <Select.Icon className="text-violet11">
                                    <ChevronDownIcon />
                                </Select.Icon>
                            </Select.Trigger>
                            <Select.Portal>
                                <Select.Content className="overflow-hidden bg-white rounded-md shadow-[0px_10px_38px_-10px_rgba(22,_23,_24,_0.35),0px_10px_20px_-15px_rgba(22,_23,_24,_0.2)]">
                                    <Select.Viewport className='p-[5px]'>
                                        <Select.Group>
                                            <Select.Label className="px-[25px] text-xs leading-[25px] text-mauve11">
                                                Duration
                                            </Select.Label>
                                            <SelectItem value="30">30 minutes</SelectItem>
                                            <SelectItem value="60">60 minutes</SelectItem>
                                            <SelectItem value="90">90 minutes</SelectItem>
                                        </Select.Group>
                                    </Select.Viewport>
                                </Select.Content>
                            </Select.Portal>
                        </Select.Root>
                    </Box>
                    <Box>
                        <div className="space-x-2">
                            <Label.Root className="text-[15px] font-medium leading-[35px] text-violet11" htmlFor="firstName">
                                Price
                            </Label.Root>
                            <input
                                className="bg-blackA2 shadow-blackA6 inline-flex h-[25px] w-[100px] appearance-none items-center justify-center rounded-[4px] px-[10px] text-[15px] leading-none text-violet11 shadow-[0_0_0_1px] outline-none focus:shadow-[0_0_0_2px_black] selection:color-white selection:bg-blackA6"
                                type="text" 
                                name="price" 
                            />
                        </div>
                    </Box>
                    <Box>
                        <Button color="violet" size="1" variant="solid" radius="large">Add</Button >
                    </Box>
                </Grid>

                {data && data.error && <p>{data.error}</p>}
            </Form>
        </>
    )
}

export const createServiceAction = async ({request}) => {
    const data = await request.formData()
    const submission = {
        service_type: data.get('service_type'),
        duration: data.get('duration'),
        price: data.get('price')
    }

    const url = `http://localhost:3000/organizations/${data.get('id')}/services`

    axios.post(url, {
        service_type: submission.service_type,
        duration: submission.duration,
        price: submission.price
    }).then(response => {
        console.log(response)
    })

    return redirect(`/organizations/${data.get('id')}`)
}

const SelectItem = React.forwardRef(({ children, className, ...props }, forwardedRef) => {
    return (
        <Select.Item className={classnames(
            'text-[13px] leading-none text-violet11 rounded-[3px] flex items-center h-[25px] pr-[35px] pl-[25px] relative select-none data-[disabled]:text-mauve8 data-[disabled]:pointer-events-none data-[highlighted]:outline-none data-[highlighted]:bg-violet9 data-[highlighted]:text-violet1',
            className
        )}    
        {...props} 
            ref={forwardedRef}
        >
            <Select.ItemText>{children}</Select.ItemText>
        </Select.Item>
    );
  });
  