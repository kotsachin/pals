package pals.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import pals.database.AddressDAO;
import pals.database.PalsUserDAO;
import pals.entity.Address;
import pals.entity.PalsUser;
import pals.exception.InvalidInputException;

@Service(value="palsUserDetailsService")
public class PalsUserDetailsService implements UserDetailsService
{
	@Autowired PalsUserDAO palsUserDAO;
	@Autowired AddressDAO addressDAO;

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException 
	{
		PalsUser user = palsUserDAO.get(username);
		if( user == null ) throw new UsernameNotFoundException("No user was found with the email: " + username);
		else return user;
	}
	
	public PalsUser createOrUpdateAddress(PalsUser user, Address newAddress) throws InvalidInputException
	{
        newAddress.validate();
        user.setName(newAddress.getFirstName() + " " + newAddress.getLastName());
        Address currentAddress = user.getHomeAddress();
        if( currentAddress != null )
        {
        	currentAddress.update(newAddress);
        	addressDAO.update(currentAddress);
        }
        else
        {
        	addressDAO.put(newAddress);
        	user.setHomeAddress(newAddress);
        }
        palsUserDAO.update(user);
        return user;
	}

	public Object get(Integer id) 
	{
		return palsUserDAO.get(id);
	}

}