/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ls_helper_functions.c                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: csummers <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/12/13 14:30:38 by csummers          #+#    #+#             */
/*   Updated: 2016/12/13 14:30:39 by csummers         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

void	ls_die(char *s)
{
	if (s)
	{
		if (ft_printf("ft_ls: %s: ", s) == -1)
			ls_die(NULL);
		perror(NULL);
	}
	else
		perror("ft_ls");
	exit(1);
}

char	*ls_add_slash(char *dir_name)
{
	if (!*dir_name)
		return (ft_strnew(0));
	else if (*(dir_name + ft_strlen(dir_name) - 1) != '/')
		return (ft_strjoin(dir_name, "/"));
	else
		return (ft_strdup(dir_name));
}

char	*ls_get_after_slash(char *path)
{
	char	*path_ptr;
	char	*ret;

	ret = path;
	path_ptr = path;
	while (*path_ptr)
	{
		if (*path_ptr == '/' && *(path_ptr + 1))
			ret = path_ptr + 1;
		path_ptr++;
	}
	return (ret);
}

size_t	ls_get_digits(size_t n)
{
	size_t	ret;

	ret = 0;
	while (n / ft_pow(10, ret))
		ret++;
	return (ret);
}

void	ls_strarrdel(char ***arr)
{
	char	**ptr;

	ptr = *arr;
	while (*ptr)
		ft_strdel(ptr++);
	ft_strarrdel(arr);
}
