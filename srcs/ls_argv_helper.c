/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ls_argv_helper.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: csummers <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/12/20 01:53:55 by csummers          #+#    #+#             */
/*   Updated: 2016/12/20 01:53:56 by csummers         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

static void		ls_sort_into(char **f_and_d, char ***dirs, char ***files)
{
	char	**ptr;
	DIR		*dir_ptr;

	ptr = f_and_d;
	while (*ptr)
	{
		if (!(dir_ptr = opendir(*ptr)))
		{
			if (errno != 2 && errno != 13)
				*files = ft_realloc_s(files, *ptr++);
			else if (errno == 13)
				*dirs = ft_realloc_s(dirs, *ptr++);
			else if (ft_printf("%wft_ls: %s: No such file or directory\n", 2,
								*ptr++) == -1)
				ls_die(NULL);
		}
		else
		{
			*dirs = ft_realloc_s(dirs, *ptr++);
			closedir(dir_ptr);
		}
	}
}

static void		ls_loop_through_dirs(char **dirs, t_ls *ls_f)
{
	char	**ptr;
	DIR		*dir_ptr;

	ptr = dirs;
	while (dirs && *ptr)
	{
		if (!(dir_ptr = opendir(*ptr)))
		{
			if (ft_printf("%wft_ls: %s: Permission denied\n", 2,
							ls_get_after_slash(*ptr++)) == -1)
				ls_die(NULL);
		}
		else
			ls_manipulate_dir(dir_ptr, ls_f, *ptr++);
		if (*ptr)
			if (ft_printf("\n%s:\n", *ptr) == -1)
				ls_die(NULL);
	}
}

void			ls_handle_argv(char **files_and_dirs, t_ls *ls_f)
{
	char	**dirs;
	char	**files;
	char	**ptr;

	dirs = NULL;
	files = NULL;
	ls_sort_into(files_and_dirs, &dirs, &files);
	if (files)
	{
		ls_print_files(files, ls_f, 1);
		ft_strarrdel(&files);
		if (dirs && *dirs && write(1, "\n", 1) == -1)
			ls_die(NULL);
	}
	if (dirs && *dirs && *(dirs + 1) && ft_printf("%s:\n", *dirs) == -1)
		ls_die(NULL);
	ptr = dirs;
	ls_loop_through_dirs(dirs, ls_f);
	if (dirs)
		ft_strarrdel(&dirs);
}
