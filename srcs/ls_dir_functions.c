/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ls_dir_functions.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: csummers <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/12/16 15:36:25 by csummers          #+#    #+#             */
/*   Updated: 2016/12/16 15:36:28 by csummers         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

static size_t	ls_dirslen(t_dir **dir_arr)
{
	size_t	i;

	i = 0;
	while (dir_arr[i])
		i++;
	return (i);
}

static t_dir	**ls_realloc_dir(t_dir ***dir_arr, DIR *dir, char *path)
{
	size_t	len;
	t_dir	**dir_ptr;
	t_dir	**ret_ptr;
	t_dir	**ret;

	len = 0;
	if (*dir_arr)
		len = ls_dirslen(*dir_arr);
	if (!(ret = (t_dir**)malloc(sizeof(t_dir*) * (len + 2))))
		ls_die(NULL);
	dir_ptr = *dir_arr;
	ret_ptr = ret;
	while (len--)
		*ret_ptr++ = *dir_ptr++;
	if (!(*ret_ptr = (t_dir*)malloc(sizeof(t_dir))))
		ls_die(NULL);
	(*ret_ptr)->path = path;
	(*ret_ptr)->ptr = dir;
	*(ret_ptr + 1) = NULL;
	free(*dir_arr);
	*dir_arr = ret;
	return (*dir_arr);
}

t_dir			**ls_find_dirs(char **files, t_ls *ls_f)
{
	DIR		*temp_dir;
	char	**files_ptr;
	char	*name;
	t_dir	**dirs;

	dirs = NULL;
	files_ptr = files;
	while (*files_ptr)
	{
		name = ls_get_after_slash(*files_ptr);
		if (!ft_strequ(name, ".") && !ft_strequ(name, "..") &&
			(*name != '.' || ls_f->a))
		{
			if ((temp_dir = opendir(*files_ptr)))
				ls_realloc_dir(&dirs, temp_dir, *files_ptr);
			else if (errno == 13)
				ls_realloc_dir(&dirs, NULL, *files_ptr);
		}
		files_ptr++;
	}
	return (dirs);
}

static void		ls_dirdel(t_dir **dir)
{
	free(*dir);
	*dir = NULL;
}

void			ls_delete_dirs(t_dir ***dirs)
{
	t_dir	**dirs_ptr;

	dirs_ptr = *dirs;
	dirs_ptr = *dirs;
	while (*dirs_ptr)
	{
		ls_dirdel(dirs_ptr);
		dirs_ptr++;
	}
	free(*dirs);
	*dirs = NULL;
}
